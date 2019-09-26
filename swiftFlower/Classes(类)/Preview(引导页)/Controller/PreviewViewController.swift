//
//  PreviewViewController.swift
//  Operate-Swift
//
//  Created by 李亚飞 on 2019/5/31.
//  Copyright © 2019 sugar. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        configureUI()
    }
    func configureUI(){
        let preScrollView = UIScrollView(frame: ScreenBounds)
        preScrollView.isPagingEnabled = true
        preScrollView.showsHorizontalScrollIndicator = false
        preScrollView.showsVerticalScrollIndicator = false
        
        var imageView: UIImageView
        var button: UIButton
        let buttonTop: CGFloat = ScreenHeight - SafeBottomHeight - 80
        for i in 0..<3 {
            imageView = UIImageView(frame: CGRect(x: CGFloat(i) * ScreenWidth, y: 0, width: ScreenWidth, height: ScreenHeight));
            if iPhonese {
                imageView.image = UIImage(named: String(format: "defoult0%li_640x1138", i+1))
            }else if iPhone {
                imageView.image = UIImage(named: String(format: "defoult0%li_750x1334", i+1))
            }else if iPhonePlus {
                imageView.image = UIImage(named: String(format: "defoult0%li_1242x2208", i+1))
            }else{
                imageView.image = UIImage(named: String(format: "defoult0%li_1125x2436", i+1))
            }
            
            if i==2{
                button  = UIButton(type:.custom)
                button.frame = CGRect(x: (ScreenWidth - 200) / 2.0, y: buttonTop, width: 200, height: 40)
                button.setTitle("立即体验", for: .normal)
                button.setTitleColor(UIColor.white, for: .normal)
                button.backgroundColor = UIColor.colorWithHexString(colorString: "007AFF")
                button.cuttingAngle(cornerRadius: 20.0)
                button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
                imageView.isUserInteractionEnabled = true
                imageView.addSubview(button)
            }
            
            preScrollView.addSubview(imageView)
        }
        
        preScrollView.contentSize = CGSize(width: ScreenWidth * 3.0, height: preScrollView.height)
        preScrollView.contentOffset = CGPoint(x: 0, y: 0)
        self.view.addSubview(preScrollView)
        
        let jumpButton  = UIButton(type:.custom)
        jumpButton.frame = CGRect(x: ScreenWidth - 90, y: 55.0, width: 60, height: 26)
        jumpButton.setTitle("跳过", for: .normal)
        jumpButton.titleLabel?.font = UIFont(name:"PingFangSC-Regular", size: 14.0)
        jumpButton.setTitleColor(UIColor.colorWithHexString(colorString: "282C2F"), for: .normal)
        jumpButton.backgroundColor = UIColor.colorWithHexString(colorString: "DCDCDC")
        jumpButton.cuttingAngle(cornerRadius: 13.0)
        jumpButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        self.view.addSubview(jumpButton)
        
        
    }
    
    
    @objc func buttonClick(){
       YFTool.saveCache(object: "YES", key: "isFirst")
//       NotificationCenter.default.post(name: NSNotification.Name(rawValue: @"PreView_Notification"), object: nil)
    }
    
    deinit {
      NotificationCenter.default.removeObserver(self)
    }

}
