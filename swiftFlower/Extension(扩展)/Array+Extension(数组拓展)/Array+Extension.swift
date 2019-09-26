//
//  Array+Extension.swift
//  Operate-Swift
//
//  Created by sugar. on 2019/1/8.
//  Copyright © 2019 sugar. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    
    mutating func remove(_ object: Element) {
        
        if let index = firstIndex(of: object) {
            
            remove(at: index)
        }
    }
    
    mutating func index(_ object: Element) -> Int {
        
        if let index = firstIndex(of: object) {
            
            return index as Int
        }
        return 0
    }
}

extension Array {
    
    mutating func replace(_ object: Element, AtIndex index: Int) {
    
        if index < self.count {
    
            remove(at: index)
            insert(object, at: index)
        }
    }
}


