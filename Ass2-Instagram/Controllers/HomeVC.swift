//
//  HomeVC.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/03/31.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    var indexArray: [Int] = [] // 클릭했던 인덱스들을 저장할 배열
    var flag: Bool = false // 배열안에 있으면 true, 아니면 false
    var cachedPosition = Dictionary<Int,CGPoint>() // 셀이 사라질 때, 마지막 offset을 저장하는 Dictionary
    var pageOfCell: [Int] = [0,0,0,0,0,0,0,0,0,0] // 셀이 사라질 때, 마지막 페이지를 저장하는 배열
    var textDataDic = Dictionary<Int, TextData>() // 네트워크 연결한 Text 정보를 저장하는 Dictionary
    var fetchingMore = false // 무한 스크롤 구현 변수
    var count = 10 // 셀의 개수
    static var i = 0 // 데이터 세팅할 때 필요. static이 아니면 비동기라 뒤죽박죽으로 되서 사용하였습니다.

    
    let network = Network.network // 네트워크 연결시 사용

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadingData()
        setNavBar()
        setTableView()
        setCollectionView()
        setConstraint()
    }
    
    // 스피너 생성
    private func createSpinnerFooter() -> UIView {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
            
            let spinner = UIActivityIndicatorView()
            spinner.center = footerView.center
            footerView.addSubview(spinner)
            spinner.startAnimating()
            
            return footerView
        }
    
    private func setNavBar() {
        // LeftButton 설정
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "InstagramLogo.png"), style: .plain, target: self, action: nil)
        
        // RightBtnView 설정
        setRightBtnView()
    }
    
    private func setRightBtnView() {
        // UIView 하나 생성
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: 75, height: 37)
        
        // Upload Button 생성
        let uploadButton = UIButton(type: .system)
        uploadButton.setImage(UIImage(named: "Add.png"), for: .normal)
        uploadButton.tintColor = .black
        
        // DM Button 생성
        let dmButton = UIButton(type: .system)
        dmButton.setImage(UIImage(named: "Messanger.png"), for: .normal)
        
        // UIView에 요소들 추가
        rightView.addSubview(uploadButton)
        rightView.addSubview(dmButton)
        
        // Constraints 생성
        uploadButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        dmButton.snp.makeConstraints { make in
            make.leading.equalTo(uploadButton.snp.trailing).offset(25.5)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        // UIView를 오른쪽 customView에 연결
        let rightItem = UIBarButtonItem(customView: rightView)
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    
    // tableView 생성
    private let tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    // collectionView 생성
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        return cv
    }()
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeFeedTableViewCell.self, forCellReuseIdentifier: "HomeFeedTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 644
        tableView.tableHeaderView = collectionView
        tableView.separatorStyle = .none    // 세퍼레이터 해제
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "storyCell")
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 98)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setConstraint() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview().offset(0)
        }
    }
    
    // 데이터 세팅
    func loadingData() {
        // 텍스트 10개씩 한번에 로드
        for _ in 0..<10 {
            self.network.getTextInfo { textData in
                self.textDataDic[HomeVC.i] = textData
                HomeVC.i += 1
                self.tableView.reloadData() // 이걸 안하면, 0,1번 인덱스의 셀이 업데이트 되지 않습니다.
            }
        }
    }

    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    @objc func labelTapped(sender: UITapGestureRecognizer) {
        guard let indexPath = tableView.indexPathForRow(at: sender.location(in: self.tableView)) else {
            print("Error: indexPath)")
            return
        }
        
        let cell = tableView.cellForRow(at: indexPath) as! HomeFeedTableViewCell
        cell.unfoldLabel()
        indexArray.append(indexPath.row)
        tableView.reloadData() // 갑자기 그냥 문제없이 됩니다....
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedTableViewCell", for: indexPath) as? HomeFeedTableViewCell else { return UITableViewCell() }
        // 셀 선택 해제 (수정)
        cell.selectionStyle = .none
        
        // 네트워크 연결하여 idLabel, contentLabel 세팅 및 재사용 문제 방지 세팅
//        network.getTextInfo { textData in
//            if self.textDataDic[indexPath.row] != nil {
//                return
//            } else {
//                cell.idLabel.text = textData.username
//                cell.contentLabel.attributedText = NSMutableAttributedString()
//                    .bold(string: "\(textData.username ?? "ground_ssu") ", fontSize: 16)
//                    .regular(string: textData.content ?? "인스타그램 클론코딩 중입니다.", fontSize: 16)
//                self.textDataDic[indexPath.row] = textData
//            }
//        }
        
        // Label 누를 때 실행
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        let moreTap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        cell.contentLabel.isUserInteractionEnabled = true
        cell.contentLabel.addGestureRecognizer(labelTap)
        cell.moreBtn.isUserInteractionEnabled = true
        cell.moreBtn.addGestureRecognizer(moreTap)
        
        // 뷰 높이 재사용 문제 해결
        for i in indexArray {
            if(i == indexPath.row) {
                flag = true
                break
            }
        }
        
        if(flag) {
            cell.isTouched = true
            flag = false
        } else {
            cell.isTouched = false
        }
        
        // 페이지 재사용 문제 해결
        cell.mainCollectionView.contentOffset = .zero // 첨으로 초기화
        cell.pageControl.currentPage = pageOfCell[indexPath.row]
        cell.setPageLabel()

        if let offset = cachedPosition[indexPath.row] {
            cell.mainCollectionView.contentOffset = offset
        }
        
        // Text 세팅
        cell.idLabel.text = textDataDic[indexPath.row]?.username
        cell.contentLabel.attributedText = NSMutableAttributedString()
                .bold(string: "\(textDataDic[indexPath.row]?.username ?? "ground_ssu") ", fontSize: 16)
                .regular(string: textDataDic[indexPath.row]?.content ?? "인스타그램 클론코딩 중입니다.", fontSize: 16)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? HomeFeedTableViewCell {
            cachedPosition[indexPath.row] = cell.mainCollectionView.contentOffset
            pageOfCell[indexPath.row] = cell.pageControl.currentPage
        }
    }
    
    // 무한 스크롤 구현
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - 100 - scrollView.frame.height
        {
            self.tableView.tableFooterView = createSpinnerFooter()
            if !fetchingMore
            {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.tableView.tableFooterView = nil
            self.count += 10
            self.pageOfCell += [0,0,0,0,0,0,0,0,0,0]
            self.loadingData()
            self.fetchingMore = false
            self.tableView.reloadData()
        })
    }

}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 98)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
}
