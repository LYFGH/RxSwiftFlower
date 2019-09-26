//
//  YFBaseNavigationViewController.swift
//  swiftFlower
//
//  Created by 李亚飞 on 2019/9/19.
//  Copyright © 2019 xxxx. All rights reserved.
//

import UIKit

class YFBaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customNavigation()
    }
    
    
    private func customNavigation() {
        
        //  关闭半透明
        self.navigationBar.isTranslucent = false
        //  重新设置背景
        self.navigationBar.barTintColor = Navigation_Blue_Color
        //  去掉阴影
        self.navigationBar.shadowImage = UIImage()
        //  设置返回按钮颜色
        self.navigationBar.tintColor = UIColor.white
        //  设置标题颜色
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "PingFangSC-Medium", size: 18.0) as Any]
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if 0 < self.viewControllers.count {
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "nav_back"), style: .plain, target: self, action: #selector(self.backClick))
        }
        
        super.pushViewController(viewController, animated: true)
    }

    @objc func backClick() {
        
        self.popViewController(animated: true)
    }

}
