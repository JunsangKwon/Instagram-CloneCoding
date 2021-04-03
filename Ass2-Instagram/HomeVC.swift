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
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeFeedTableViewCell.self, forCellReuseIdentifier: "HomeFeedTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
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
