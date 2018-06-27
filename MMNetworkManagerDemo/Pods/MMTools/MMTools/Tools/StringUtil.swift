//
//  StringUtil.swift
//  mts-manager
//
//  Created by lizhe on 2018/3/8.
//  Copyright © 2018年 com.ctsi.mts.iphone. All rights reserved.
//

import Foundation

extension String {
    public func substring(from start: Int, strLength length: Int) -> String {
        if self.count >= start + length {
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: start + length)
            let subString = self[startIndex..<endIndex]
            
            return String(subString)
        } else {
            return self
        }
    }
    
    public func toFloat() -> Float? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.floatValue
    }
    
    public func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        return numberFormatter.number(from: self)?.doubleValue
    }
   
//    public var md5 : String{
//        let str = self.cString(using: String.Encoding.utf8)
//        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result =  UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
//        
//        CC_MD5(str!, strLen, result)
//        let hash = NSMutableString()
//        for i in 0 ..< digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        result.deinitialize()
//        
//        return String(format: hash as String)
//    }
}
