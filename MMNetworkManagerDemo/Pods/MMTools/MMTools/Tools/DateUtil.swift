//
//  DateUtil.swift
//  mts-manager
//
//  Created by 李哲 on 2018/6/24.
//  Copyright © 2018年 com.ctsi.mts.iphone. All rights reserved.
//

import Foundation

public class DateUtil {
    
    public static func DateFormatToString(date:Date, format:String)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }
    
    public static func SecondsToDate(seconds:Int)->Date {
        return Date(timeIntervalSince1970: TimeInterval(seconds))
    }
    
    public static func MilliSecondsToDate(seconds:Int)->Date {
        return DateUtil.SecondsToDate(seconds:seconds/1000)
    }
    
    public static func SecondsToDate(seconds:NSNumber)->Date {
        return Date(timeIntervalSince1970: TimeInterval(seconds.intValue))
    }
    
    public static func MilliSecondsToDate(seconds:NSNumber)->Date {
        return DateUtil.SecondsToDate(seconds:seconds.intValue/1000)
    }
    
    public static func SecondsToDate(date:Date)->NSNumber {
        return NSNumber(value: date.timeIntervalSince1970)
    }
    
    public static func MilliSecondsToDate(date:Date)->NSNumber {
        return NSNumber(value: date.timeIntervalSince1970 * 1000)
    }
    
    public static func dateToString(date:Date)->String {
        
        return DateUtil.DateFormatToString(date: date, format: "YYYY-MM-dd HH:mm:ss")
    }
    
    public static func dateToStringnew(date:Date)->String {
        return DateUtil.DateFormatToString(date: date, format: "YYYY/MM/dd HH:mm")
    }
    
    public static func dateToStringYMD(date:Date)->String {
        return DateUtil.DateFormatToString(date: date, format: "YYYY-MM-dd")
    }
}
