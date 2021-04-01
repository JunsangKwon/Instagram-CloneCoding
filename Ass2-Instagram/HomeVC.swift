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
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeFeedTableViewCell.self, forCellReuseIdentifier: "HomeFeedTableViewCell")
        setConstraint()
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setNavBar() {
        // LeftButton 설정
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "InstagramLogo.png"), style: .plain, target: self, action: nil)
        
        // Container가 될 Array를 생성
        var rightBarButtons: [UIBarButtonItem] = []
        
        // Array에 버튼 아이템을 추가
        let dmButton = UIBarButtonItem(image: UIImage(named: "Messanger.png"), style: .plain, target: self, action: nil)
        let uploadButton = UIBarButtonItem(image: UIImage(named: "Add.png"), style: .plain, target: self, action: nil)
        uploadButton.tintColor = .black
        rightBarButtons.append(dmButton)
        rightBarButtons.append(uploadButton)

        // rightBarButtonItems 배열을 셋업
        self.navigationItem.rightBarButtonItems = rightBarButtons
    }
    
    // tableView 생성
    private let tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
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
