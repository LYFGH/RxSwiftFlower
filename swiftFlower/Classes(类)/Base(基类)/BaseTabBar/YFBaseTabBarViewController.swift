//
//  YFBaseTabBarViewController.swift
//  swiftFlower
//
//  Created by 李亚飞 on 2019/9/19.
//  Copyright © 2019 xxxx. All rights reserved.
//

import UIKit

class YFBaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    

    func configureUI() {
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.colorWithHexString(colorString: "#282C2F")], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: Navigation_Blue_Color], for: .selected)
        
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = YFTool.getImage(color: UIColor.colorWithHexString(colorString: "#d2d9e1", alpha: 0.88), size: CGSize(width: ScreenWidth, height: 0.5))
        
        let homeVC = TestViewController()
        homeVC.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "tab_home_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_home_selected")?.withRenderingMode(.alwaysOriginal))
        let homeNavigationVC = YFBaseNavigationViewController(rootViewController: homeVC)
        
        let messageVC = TestViewController()
        messageVC.tabBarItem = UITabBarItem(title: "消息", image: UIImage(named: "tab_message_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_message_selected")?.withRenderingMode(.alwaysOriginal))
        //        messageVC.hidesBottomBarWhenPushed = true
        let messageNavigationVC = YFBaseNavigationViewController(rootViewController: messageVC)
        
        let mineVC = TestViewController()
        mineVC.title = "我的"
        mineVC.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "tab_mine_normal")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "tab_mine_selected")?.withRenderingMode(.alwaysOriginal))
        let mineNavigationVC = YFBaseNavigationViewController(rootViewController: mineVC)
        
        self.viewControllers = [homeNavigationVC, messageNavigationVC, mineNavigationVC]
    }

}
