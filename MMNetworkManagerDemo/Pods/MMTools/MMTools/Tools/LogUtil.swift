//
//  LogUtil.swift
//  mts-manager
//
//  Created by lizhe on 2018/3/14.
//  Copyright © 2018年 com.ctsi.mts.iphone. All rights reserved.
//
import Foundation
import UIKit

let LogPath = "\(USER_PHONENUM)"
class LogUtil {
    public static func write(content:String, fold:String) {
        let dateFormatter = DateFormatter()
//        withFormat: "YYYY-MM-DD", locale: "en_US"
        dateFormatter.dateFormat = "YYYY-MM-DD"
        dateFormatter.locale = Locale(identifier: "en_US") 
        let dateStr = dateFormatter.string(from: Date())
        let foldUrl = "\(USER_PHONENUM)" + "/" + dateStr + "/" + fold
        let foldPath: String = NSHomeDirectory() + "/Documents/Logs/" + foldUrl
        let filePath = "\(foldPath)/log.txt"
        
        if LogUtil.checkFile(filePath: filePath) == false {
            if LogUtil.checkDirectory(filePath: foldPath) == false {
                return
            }
            if LogUtil.createFile(filePath: filePath) == false {
                return
            }
        }
        guard let fileHandle = FileHandle(forWritingAtPath: filePath) else {
            return
        }
       
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatter1.locale = Locale(identifier: "en_US")
        let dateStr1 = dateFormatter1.string(from: Date())
        
        let contentStr = "\n[\(dateStr1)] : \(content)"
        let contentData = contentStr.data(using: String.Encoding.utf8)
        
        fileHandle.seekToEndOfFile()
        fileHandle.write(contentData!)
        fileHandle.closeFile()
    }
    
    public static func write(key:String, value:String, fold:String = "protocol") {
        let content = "\(key):\(value)"
        
        LogUtil.write(content: content, fold: fold)
       
    }
    
    //检查文件夹是否存在,不存在则创建
    public static func checkDirectory(filePath:String)->Bool {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) == false {
            //创建文件夹
            do{
                try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
            }catch {
                return false
            }
            
        }
        return true;
    }
    
    //检查文件是否存在
    public static func checkFile(filePath:String)->Bool {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: filePath)
    }
    
    public static func createFile(filePath:String)->Bool {
        let fileManager = FileManager.default
        //创建文件
        return  fileManager.createFile(atPath: filePath, contents: nil, attributes: nil)
    }
    
    
    //生成压缩文件 -> 地址
    public static func zipFiles(files:Array<Any>)->String {
//        let foldUrl = "\(USER_PHONENUM)" + "/" + dateStr + "/" + fold
//        let foldPath: String = NSHomeDirectory() + "/Documents/Logs/" + foldUrl
//        let filePath = "\(foldPath)/log.txt"
//
//        //生成zip文件名字
//        let zipFileName =
//        NSString * zipFileName = [NSString stringWithFormat:@"%@.zip",[self getDate]];
//        //取得zip文件全路径
//        NSString * zipPath = [NSString stringWithFormat:@"%@/%@",directoryPath,zipFileName];
        return ""
    }
    
    
    
}

