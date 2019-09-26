//
//  YFTool.swift
//  swiftFlower
//
//  Created by 李亚飞 on 2019/9/19.
//  Copyright © 2019 xxxx. All rights reserved.
//

import UIKit
import Photos
import AVFoundation


class YFTool: NSObject {

    
    
    /// 获取版本
    ///
    /// - Returns: 版本
    class func getVersion() -> String {
        
        let infoDictionary = Bundle.main.infoDictionary!
        
        return infoDictionary["CFBundleShortVersionString"]! as! String
    }
    
    
    /// 是否是X系列
    ///
    /// - Returns: false/true
    class func isPhoneX() -> Bool {
        
        var isPhoneX = false
        if #available(iOS 11.0, *) {
            
            isPhoneX = CGFloat((KeyWindow?.safeAreaInsets.bottom)!) > 0.0
        }
        return isPhoneX
    }
    
    
    /// 缓存数据
    ///
    /// - Parameters:
    ///   - object: 数据
    ///   - key: 键名
    class func saveCache(object: Any, key: String) {
        
        let userDefults = UserDefaults.standard
        let data = NSKeyedArchiver.archivedData(withRootObject: object)
        userDefults.set(data, forKey: key)
    }
    
    /// 获取缓存数据
    ///
    /// - Parameter key: 键名
    /// - Returns: 数据
    class func getCache(key: String) -> Any? {
        
        if UserDefaults.standard.data(forKey: key) == nil {
            return nil
        } else {
            return NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.data(forKey: key)!)
        }
    }
    
    /// 清理缓存
    ///
    /// - Parameter key: 键名
    class func calerCache(key: String) {
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    
    /// 检测相册是否开启
    ///
    /// - Returns: true/false
    class func isAlbumOpen() -> Bool {
        
        let status = PHPhotoLibrary.authorizationStatus()
        return status != .restricted && status != .denied
    }
    
    
    /// 检测定位是否开启
    ///
    /// - Returns: true/false
    class func isAdressLocation() -> Bool {
        
        //确定用户的位置服务是否启用,位置服务在设置中是否被禁用
        let enable : Bool  = CLLocationManager.locationServicesEnabled()
        let status : Int   = CLLocationManager.authorizationStatus();
        if(  !enable || status < 2){
            //尚未授权位置权限
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8)
            {
                //系统位置授权弹窗
                _locationManager =[[CLLocationManager alloc]init];
                [_locationManager requestAlwaysAuthorization];
                [_locationManager requestWhenInUseAuthorization];
            }
        }
    }
    
    
    
    /// 是否拥有相机
    ///
    /// - Returns: true/false
    class func isHasCamera() -> Bool {
        
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    
    /// 检测相机是否开启
    ///
    /// - Returns: true/false
    class func isCameraOpen() -> Bool {
        
        if !YFTool.isHasCamera() {
            return false
        }
        
        let status: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        return status != .restricted && status != .denied
    }
    
    
    /// 获取IP
    ///
    /// - Returns: String
    class func getIpAddress() -> String {
        
        var addresses = [String]()
        
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        
        if getifaddrs(&ifaddr) == 0 {
            
            var ptr = ifaddr
            
            while (ptr != nil) {
                
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            
                            if let address = String(validatingUTF8:hostname) {
                                
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        return addresses.first ?? "0.0.0.0"
    }
    
    /// 字典转Json
    ///
    /// - Parameter dictionary: dictionary
    /// - Returns: Json
    class func dictionaryToJson(dictionary: [String: Any]) -> String {
        
        if !JSONSerialization.isValidJSONObject(dictionary) {
            return ""
        }
        let data: Data = try! JSONSerialization.data(withJSONObject: dictionary, options: []) as Data
        return String(data: data, encoding: String.Encoding.utf8)!
    }
    
    /// 转换为字符串
    ///
    /// - Parameter object: 传入的字段
    /// - Returns: 返回字符串
    class func anyToString(object: Any) -> String {
        
        if let objectNumber = object as? NSNumber {
            return "\(objectNumber)"
        } else if object is NSNull {
            return ""
        } else if let objectStr = object as? NSString {
            return objectStr as String
        } else if let objectStr = object as? String {
            return objectStr
        } else {
            return ""
        }
    }
    
    /// 字符串替换
    ///
    /// - Parameters:
    ///   - oldStr: 需要改变的字符串
    ///   - beginCount: 第几位开始替换
    ///   - endCount: 第几位结束替换
    ///   - replaceStr: 第几位结束替换
    /// - Returns: String
    class func replaceMethod(oldStr: String, beginCount: Int, endCount: Int, replaceStr:String) -> String {
        var chageStr = ""
        var indexLenth : Int = 0
        if beginCount == 0{
            indexLenth = endCount - beginCount
        }else{
            indexLenth = endCount - beginCount + 1
        }
        for _ in 0..<indexLenth{
            chageStr = chageStr.appending(replaceStr)
        }
        
        let startIndex = oldStr.index(oldStr.startIndex, offsetBy: beginCount)
        let endIndex = oldStr.index(oldStr.startIndex, offsetBy: endCount)
        let newStr = oldStr.replacingCharacters(in: startIndex...endIndex, with: chageStr)
        return newStr
    }
    
    /// 生成纯色的图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 尺寸
    /// - Returns: 返回一张纯色图片
    
    class func getImage(color: UIColor, size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        
        color.setFill()
        
        path.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    
}
