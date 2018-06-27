//
//  ColorConstants.swift
//  mts-manager
//
//  Created by lizhe on 2018/2/24.
//  Copyright © 2018年 com.ctsi.mts.iphone. All rights reserved.
//

import UIKit

extension UIColor {
    public static let mtsBlue              = UIColor.blue
    public static let mtsWhite             = UIColor.white
    public static let mtsRedMain           = UIColor.rgb(254, 85, 95)          //主题红
    public static let mtsGray              = UIColor.gray          
    public static let mtsBlack             = UIColor.black
    public static let mtsSepeLineColor     = UIColor.rgb(220, 220, 220)        //分割线颜色
    public static let mtsTitleBlack        = UIColor.rgb(51, 51, 51)        //分割线颜色
    public static let mtsTranslucentColor  = UIColor.rgba(44, 44, 44, 0.8)
    public static let mtsBackgroud         = UIColor.rgba(249, 249, 249, 1)    //工作上报背景色
    public static let mtsTabNormal         = UIColor.rgba(146, 146, 146, 1)    //tab normal字体颜色
}

extension UIColor {
    
    public static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor.init(red: r / 255,
                            green: g / 255,
                            blue: b / 255,
                            alpha: 1.0)
    }
    
    public static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a:CGFloat) -> UIColor {
        return UIColor.init(red: r / 255,
                            green: g / 255,
                            blue: b / 255,
                            alpha: a)
    }
    
    public static func colorFromHex(_ Hex: UInt32) -> UIColor {
        return UIColor.init(red: CGFloat((Hex & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((Hex & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((Hex & 0xFF)) / 255.0,
                            alpha: 1.0)
    }
    
}
