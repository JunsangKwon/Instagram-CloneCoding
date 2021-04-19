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
    var cachedPosition = Dictionary<Int,CGPoint>() // 셀이 사라질 때, 마지막 offset을 저장하는 배열
    var pageOfCell: [Int] = [0,0,0,0,0,0,0,0,0,0] // 셀이 사라질 때, 마지막 페이지를 저장하는 배열

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        setTableView()
        setCollectionView()
        setConstraint()
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

        return 10

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedTableViewCell", for: indexPath) as? HomeFeedTableViewCell else { return UITableViewCell() }
        // 셀 선택 해제 (수정)
        cell.selectionStyle = .none
        // Label 누를 때 실행, 현재 더블 클릭을 해야만 넓어지는 문제 발생
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

        return cell

    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? HomeFeedTableViewCell {
            cachedPosition[indexPath.row] = cell.mainCollectionView.contentOffset
            pageOfCell[indexPath.row] = cell.pageControl.currentPage
        }
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
