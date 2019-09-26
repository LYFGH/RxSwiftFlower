//
//  TextField+Extension.swift
//  Operate-Swift
//
//  Created by sugar. on 2019/5/21.
//  Copyright © 2019 sugar. All rights reserved.
//

import UIKit

extension UITextField {
    
    func selectedRange() -> NSRange {
        
        let beginning = self.beginningOfDocument
        let selectedRange = self.selectedTextRange
        let selectionStart = selectedRange!.start
        let selectionEnd = selectedRange!.end
        
        let location: NSInteger = self.offset(from: beginning, to: selectionStart)
        let length: NSInteger = self.offset(from: selectionStart, to: selectionEnd)
        
        return NSRange.init(location: location, length: length)
    }
    
    func setSelectedRange(range: NSRange) {
        
        let beginning = self.beginningOfDocument
        
        let startPosition = self.position(from: beginning, offset: range.location)!
        let endPosition = self.position(from: beginning, offset: range.location + range.length)!
        
        let selectionRange = self.textRange(from: startPosition, to: endPosition)
        self.selectedTextRange = selectionRange
    }
}
