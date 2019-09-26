//
//  View+Extension.swift
//  Broker-Swift
//
//  Created by Sugar. on 2018/5/24.
//  Copyright © 2018年 Sugar. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIView {
    
    //  x
    var x: CGFloat {
        
        get {
            
            return frame.origin.x
        }
        set (newVal) {
            
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newVal
            frame = tempFrame
        }
    }
    
    //  y
    var y: CGFloat {
        
        get {
            
            return frame.origin.y
        }
        set (newVal) {
            
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newVal
            frame = tempFrame
        }
    }
    
    //  width
    var width: CGFloat {
        
        get {
            
            return frame.size.width
        }
        set (newVal) {
            
            var tempFrame: CGRect = frame
            tempFrame.size.width = newVal
            frame = tempFrame
        }
    }
    
    //  height
    var height: CGFloat {
        
        get {
            
            return frame.size.height
        }
        set (newVal) {
            
            var tempFrame: CGRect = frame
            tempFrame.size.height = newVal
            frame = tempFrame
        }
    }
    
    //  left
    var left: CGFloat {
        
        get {
            
            return x
        }
        set (newVal) {
            
            x = newVal
        }
    }
    
    //  right
    var right : CGFloat {
        
        get {
            
            return x + width
        }
        
        set(newVal) {
            
            x = newVal - width
        }
    }
    
    //  top
    var top : CGFloat {
        
        get {
            
            return y
        }
        
        set(newVal) {
            
            y = newVal
        }
    }
    
    //  bottom
    var bottom : CGFloat {
        
        get {
            
            return y + height
        }
        
        set(newVal) {
            
            y = newVal - height
        }
    }
    
    //  centerX
    var centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    //  centerY
    var centerY : CGFloat {
        
        get {
            
            return center.y
        }
        
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    //  middleX
    var middleX : CGFloat {
        
        get {
            
            return width / 2
        }
    }
    
    //  middleY
    var middleY : CGFloat {
        
        get {
            
            return height / 2
        }
    }
    
    //  middlePoint
    var middlePoint : CGPoint {
        
        get {
            
            return CGPoint(x: middleX, y: middleY)
        }
    }
    
    //  rightBottomPoint
    var rightBottomPoint : CGPoint {
        
        get {
            
            return CGPoint(x: width, y: height)
        }
    }

    
    //  MARK: 切角
    /// 切角
    func cuttingAngleDefault() {
        
        self.cuttingAngle(cornerRadius: 5)
    }
    
    /// 切角
    ///
    /// - Parameter cornerRadius: 半径
    func cuttingAngle(cornerRadius: CGFloat) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    //  MARK: 边框
    /// 边框
    func addBorder() {
        
        self.addBorder(borderColor: UIColor.lightGray, borderWidth: 0.5)
    }
    
    /// 边框
    ///
    /// - Parameter borderColor: 颜色
    func addBorder(borderColor: UIColor) {
        
        self.addBorder(borderColor: borderColor, borderWidth: 0.5)
    }
    
    /// 边框
    ///
    /// - Parameters:
    ///   - borderColor: 颜色
    ///   - borderWidth: 边框宽度
    func addBorder(borderColor: UIColor, borderWidth: CGFloat) {
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    //  MARK: 切角加边框
    /// 切角加边框
    ///
    /// - Parameters:
    ///   - cornerRadius: 半径
    ///   - borderColor: 颜色
    ///   - borderWidth: 边框宽度
    func cuttingAngle(cornerRadius: CGFloat, borderColor:UIColor, borderWidth: CGFloat) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    
    /// 添加阴影
    ///
    /// - Parameters:
    ///   - shadowColor: 颜色
    ///   - shadowOffset: 偏移量
    ///   - shadowRadius: 半径
    ///   - shadowOpacity: 透明度
    func addShadow(shadowColor: UIColor, shadowOffset: CGSize, shadowRadius: CGFloat, shadowOpacity: CGFloat) {
        
        self.clipsToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = Float(shadowOpacity)
    }

    
    /// 创建MBProgressHUD
    ///
    /// - Parameter message: 提示信息
    /// - Returns: MBProgressHUD
    private func createMBProgressHUMessage(message: String?) -> MBProgressHUD {
        
        let hud: MBProgressHUD = MBProgressHUD.showAdded(to: self, animated: true)
        hud.detailsLabel.text = message ?? nil
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        hud.removeFromSuperViewOnHide = true
        return hud
    }
    
    /// 显示MBProgressHUD
    func showProgressHud() {
        
        self.showProgressHud(message: nil)
    }
    
    /// 显示MBProgressHUD
    ///
    /// - Parameter message: 提示信息
    func showProgressHud(message: String?) {
        
        self.hideProgressHud()
        let hud = createMBProgressHUMessage(message: message)
        hud.mode = .indeterminate
    }
    
    /// 显示提示
    ///
    /// - Parameter message: 提示消息
    func showHud(message: String) {
        
        self.showHud(message: message, timer: 0)
    }
    
    /// 显示提示并在2.0秒后关闭
    ///
    /// - Parameter message: 信息
    func showHudAutoClose(message: String) {
        
        self.showHud(message: message, timer: 2.0)
    }
    
    /// 显示提示并在自定义时间后关闭
    ///
    /// - Parameters:
    ///   - message: 提示信息
    ///   - timer: 显示时间
    func showHud(message: String, timer: Double) {
        
        self.hideProgressHud()
        
        let hud = createMBProgressHUMessage(message: message)
        hud.mode = .text
        if 0 < timer {
            hud.hide(animated: true, afterDelay: timer)
        }
    }
    
    /// 隐藏等待圈
    func hideProgressHud() {
        
        MBProgressHUD.hide(for: self, animated: true)
    }
}


