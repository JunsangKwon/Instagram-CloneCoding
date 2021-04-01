//
//  ViewController.swift
//  Ass2-Instagram
//
//  Created by 권준상 on 2021/03/29.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        let homeNVC = UINavigationController(rootViewController: HomeVC())
        let searchVC = SearchVC()
        let videoVC = VideoVC()
        let noticeVC = NoticeVC()
        let userVC = UserVC()
      
        self.setViewControllers([homeNVC,searchVC, videoVC, noticeVC, userVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["Home.png","Search.png","Video.png","Heart.png","User.png"]
        
        for i in 0...4 {
            items[i].image = UIImage(named: images[i])
        }
    }

}

