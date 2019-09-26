//
//  String+Extension.swift
//  Operate-Swift
//
//  Created by sugar. on 2019/1/9.
//  Copyright © 2019 sugar. All rights reserved.
//

import UIKit

extension String {
    
    /// 是否为手机号
    ///
    /// - Returns: true/false
    func isPhone() -> Bool {
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^1([0-9])\\d{9}$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    //  是否为数字
    func isPurnInt() -> Bool {
        
        let scan: Scanner = Scanner(string: self)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    //  是否为字母
    func isLetter() -> Bool {
        
        for char in self.utf8 {
            
            if char < 64 || (91 < char && char < 96) || 123 < char {
                return false
            }
        }
        return true
    }
    
    
    //  是否为大写字母
    func isCapitalizationLetter() -> Bool {
        
        for char in self.utf8 {
            
            if char < 64 || 91 < char {
                return false
            }
        }
        return true
    }
    
    
    /// 是否为字母数字混合
    ///
    /// - Returns: true/false
    func isLetterAndPurnInt() -> Bool {
        
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^[a-z,A-Z,0-9]{0,7}$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    
    /// 是否为验证码
    ///
    /// - Returns: true/false
    func isVailCode() -> Bool {
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^([0-9])\\d{5}$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    /// 是否为邮箱
    ///
    /// - Returns: true/false
    func isEmail() -> Bool {
        
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if  tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    /// 是否为身份证号
    ///
    /// - Returns: true/false
    func isCard() -> Bool {
        
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x)$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if  tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    /// 是否为中文
    ///
    /// - Returns: true/false
    func isChinese() -> Bool {
        
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^[\u{4e00}-\u{9fa5}]+$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if  tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    /// 是否为密码
    ///
    /// - Returns: true/false
    func isPassWord() -> Bool {
        
        let tempString = self.replacingOccurrences(of: " ", with: "")
        let tempRegex = "^(?![0-9]+$)[a-zA-Z0-9]{8,16}$";
        let tempRegextest = NSPredicate(format: "SELF MATCHES %@", tempRegex)
        if  tempRegextest.evaluate(with: tempString){
            return true
        }
        return false
    }
    
    
    
    
}


