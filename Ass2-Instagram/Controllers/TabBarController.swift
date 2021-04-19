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
        self.delegate = self
        setTabBar()
    }
    
    var flag = false
    
    func setTabBar() {
        let homeNVC = UINavigationController(rootViewController: HomeVC())
        let searchVC = SearchVC()
        let videoVC = VideoVC()
        let noticeVC = NoticeVC()
        let userVC = UserVC()
      
        self.setViewControllers([homeNVC,searchVC, videoVC, noticeVC, userVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["Home.png","Search.png","Video.png","Heart.png","User.png"]
        let selectedimages = ["Home_s.png","Search_s.png","Video_s.png","Heart_s.png","User_s.png"]
        
        for i in 0...4 {
            items[i].image = UIImage(named: images[i])
            items[i].selectedImage = UIImage(named: selectedimages[i])
            if i == 2 {
                items[i].title = " "
            }
        }
        
    }

}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        if (item.title == " ") {
            self.overrideUserInterfaceStyle = .dark
        }
        else {
            self.overrideUserInterfaceStyle = .light
        }
    }

}
