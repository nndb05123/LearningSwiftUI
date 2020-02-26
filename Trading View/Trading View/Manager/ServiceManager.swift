//
//  ServiceManager.swift
//  WebApp
//
//  Created by Covisoft Viet Nam on 5/16/17.
//  Copyright © 2017 Covisoft Viet Nam. All rights reserved.
//

import Foundation
import Alamofire


public  enum ErrorAlamofire: Int {
    case errorFetching = 0
    case dataMalformed
}

public class ServiceManager {
    
    private static var  shareInstance: ServiceManager  = {
        let instance = ServiceManager ()
        return instance
    }()
    
    public class func defaults() -> ServiceManager {
        return .shareInstance
    }
    
    fileprivate var request: Alamofire.Request?
    
    func headersXForm() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Basic eW91dHJhZGVfaXM0X3JvX2NsaWVudDo="
        ]
        return headers
    }
    
    func headersBearerAcess() -> HTTPHeaders {
        //let headersBearerAcess:HTTPHeaders = ["Authorization":"Bearer \(Store.shared.getAuthModel()!.access_token!)",
        //    "Content-Type":"application/json"]
        let headersBearerAcess:HTTPHeaders = ["Content-Type":"application/json"]
        return headersBearerAcess
    }
    
   
    
    func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            // "Accept": "application/json",
        ]
        
        
        return headers
    }
    
    func suspend(){
        self.request?.suspend()
    }
    
    func resume(){
        self.request?.resume()
    }
    
    func cancel(){
        self.request?.cancel()
    }
    
    
    func requestAlarmofire<T>(method:HTTPMethod,headers:HTTPHeaders?,url: String , params: [String:Any]?, completion:@escaping (T) -> Void, error:@escaping (ErrorAlamofire) -> Void) {
        

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            ServiceManager.defaults().cancel()
        }
        
        Alamofire.request(
            url,
            method: method,
            parameters: params,
            encoding:  JSONEncoding.default,
            headers: headers == nil ? self.headers() : headers)
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    error(.errorFetching)
                    return
                }
                
                guard let data = response.result.value as? T  else {
                    print("Malformed data received from fetchAllRooms service")
                    error(.dataMalformed)
                    return
                }
                completion(data)
        }
        
    }
    
    
    func requestAlarmofirePost<T>(headers:HTTPHeaders?, url: String , params: [String:Any]?, completion:@escaping (T) -> Void, error:@escaping (ErrorAlamofire) -> Void) {
        

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
            ServiceManager.defaults().cancel()
        }
        
        var encoding:ParameterEncoding = JSONEncoding.default
        if let headers = headers{
            if headers == ServiceManager.defaults().headersXForm() {
                encoding = URLEncoding.default
            }
        }
        
        Alamofire.request(url, method: .post, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                error(.errorFetching)
                return
            }
            
            guard let data = response.result.value as? T  else {
                print("Malformed data received from fetchAllRooms service")
                error(.dataMalformed)
                return
            }
            
            completion(data)
            
        }
        
    }
    
    func requestAlarmofireDelete(headers:HTTPHeaders?, url: String , params: [String:Any]?, completion:@escaping (Bool) -> Void, error:@escaping (ErrorAlamofire) -> Void) {
        

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            ServiceManager.defaults().cancel()
        }
        
        var encoding:ParameterEncoding = JSONEncoding.default
        if let headers = headers{
            if headers == ServiceManager.defaults().headersXForm() {
                encoding = URLEncoding.default
            }
        }
        
        
        Alamofire.request(url, method: .delete, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 200 {
                  completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
    func requestAlarmofirePutWithNoReponseData(headers:HTTPHeaders?, url: String , params: [String:Any]?, completion:@escaping (Bool) -> Void, error:@escaping (ErrorAlamofire) -> Void) {
        

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            ServiceManager.defaults().cancel()
        }
        
        var encoding:ParameterEncoding = JSONEncoding.default
        if let headers = headers{
            if headers == ServiceManager.defaults().headersXForm() {
                encoding = URLEncoding.default
            }
        }
        
        
        Alamofire.request(url, method: .put, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
    func requestAlarmofireWithNoReponseData(method:HTTPMethod,headers:HTTPHeaders?, url: String , params: [String:Any]?, completion:@escaping (Bool) -> Void, error:@escaping (ErrorAlamofire) -> Void) {
        

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            ServiceManager.defaults().cancel()
        }
        
        var encoding:ParameterEncoding = JSONEncoding.default
        if let headers = headers{
            if headers == ServiceManager.defaults().headersXForm() {
                encoding = URLEncoding.default
            }
        }
        
        
        Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == 200 {
                completion(true)
            } else {
                completion(false)
            }
        }
        
    }
    
    func requestAlarmofireWithNoReponseData(method:HTTPMethod,headers:HTTPHeaders?, url: String , params: [String:Any]?, completion:@escaping (Bool,Int,String) -> Void, error:@escaping (ErrorAlamofire) -> Void) {
        

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            ServiceManager.defaults().cancel()
        }
        
        var encoding:ParameterEncoding = JSONEncoding.default
        if let headers = headers{
            if headers == ServiceManager.defaults().headersXForm() {
                encoding = URLEncoding.default
            }
        }
        
        
        Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            print("Check: code \(String(describing: response.response?.statusCode))")
            let data = response.data
            let utf8Text:String = String(data: data!, encoding: .utf8)!
            if response.response?.statusCode == 200 {
                completion(true,200,utf8Text)
            } else {
                completion(false,response.response?.statusCode ?? 400, utf8Text)
            }
        }
        
    }

    func requestAlarmofireWithNoReponseData(method:HTTPMethod,headers:HTTPHeaders?, url: String , params: [String:Any]?, completion:@escaping (Bool,Int) -> Void, error:@escaping (ErrorAlamofire) -> Void) {


        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            ServiceManager.defaults().cancel()
        }

        var encoding:ParameterEncoding = JSONEncoding.default
        if let headers = headers{
            if headers == ServiceManager.defaults().headersXForm() {
                encoding = URLEncoding.default
            }
        }


        Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                completion(true,200)
            } else {
                completion(false,response.response?.statusCode ?? 400)
            }
        }

    }
    

}
