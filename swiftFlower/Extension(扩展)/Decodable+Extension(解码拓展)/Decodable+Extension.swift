//
//  Decodable+Extension.swift
//  Operate-Swift
//
//  Created by sugar. on 2019/1/8.
//  Copyright © 2019 sugar. All rights reserved.
//

import UIKit

extension Decodable {
    
    static func analysisJson(result: NSDictionary) -> AnyObject? {
        
        if let dic: NSDictionary = result["data"] as? NSDictionary {
            
            let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            
            let model = try! JSONDecoder().decode(self, from: data)
            
            return model as AnyObject
            
        } else {
            
            let data = try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
            
            let model = try! JSONDecoder().decode(self, from: data)
            
            return model as AnyObject
        }
    }
}


