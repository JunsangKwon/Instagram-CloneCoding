//
//  HomeVC.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/03/31.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

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
        tableView.tableHeaderView = collectionView
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedTableViewCell", for: indexPath) as? HomeFeedTableViewCell else { return UITableViewCell() }

        return cell

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
