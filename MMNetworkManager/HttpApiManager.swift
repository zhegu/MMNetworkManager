//
//  HttpApiManager.swift
//  mts-manager
//
//  Created by lizhe on 2018/2/23.
//  Copyright © 2018年 com.ctsi.mts.iphone. All rights reserved.
//

// this is a test
import Foundation
import Moya
import ObjectMapper
import RxSwift

public enum HttpConfig {
    case Develop
    case Test
    case PreRelease
    case Release
}

public var httpConfig:HttpConfig = .Test
public var httpBaseUrl:URL{
    switch httpConfig {
    case .Develop:
        return URL.init(string:"http://192.168.5.9:8082")!
    case .Test:
        return URL.init(string:"http://192.9.100.76:60001")!
    case .PreRelease:
        return URL.init(string:"11")!
    case .Release:
        return URL.init(string:"http://118.85.200.78:60008")!
    }
}

public var httpFreeExperienceUrl:URL{
    switch httpConfig {
    case .Develop:
        return URL.init(string:"http://192.9.100.76:60007/mts/api/client_api.html")!
    case .Test:
        return URL.init(string:"http://111.235.156.38/mts/api/client_api.html?comefrom=ios")!
    case .PreRelease:
        return URL.init(string:"http://118.85.200.84:38080/mts/api/client_api.html")!
    case .Release:
        return URL.init(string:"http://111.235.156.38/mts/api/client_api.html?comefrom=ios")!
    }
}

public struct NetworkRequest {
    static var requestLoading:RequestLoadingPlugin? = nil
    static var baseRxProvicer:MoyaProvider<MultiTarget>? = nil
    
    //封装快速网络请求方法
    public static func getProvice(_ hideView:Bool)->MoyaProvider<MultiTarget> {
        requestLoading = RequestLoadingPlugin(hideView)
        baseRxProvicer = MoyaProvider<MultiTarget>(endpointClosure:myEndpointClosure, requestClosure: myRequestClosure, stubClosure:myStubClosure, plugins:[networkLoggerPlugin,newworkActivityPlugin,requestLoading!])
        return baseRxProvicer!

    }
    
    
    //封装常用请求
    public static func mtsRequest<T: Mappable>(_ hideView:Bool,_ target:MultiTarget,_ type: T.Type)-> Observable<(code:Int, object:T?, message:String, serverTime:Int)>{
       return NetworkRequest.getProvice(hideView).rx
            .request(target)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .asObservable()
            .mapObject(type: type)
    }
    
    // MARK: -取消所有请求
    public static func cancelAllRequest() {
        //    MyAPIProvider.manager.session.invalidateAndCancel()  //取消所有请求
        baseRxProvicer?.manager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
        
        //let sessionManager = Alamofire.SessionManager.default
        //sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
        //    dataTasks.forEach { $0.cancel() }
        //    uploadTasks.forEach { $0.cancel() }
        //    downloadTasks.forEach { $0.cancel() }
        //}
        
    }
}
