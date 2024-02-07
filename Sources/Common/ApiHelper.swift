//
//  File.swift
//  
//
//  Created by Fermion Mac 2022 - 1 on 07/02/24.
//

import Foundation


let headers: HTTPHeaders = [
    // "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
    "content-type": "application/json",
    "request-type": "app",
    "signature-value": "7c4eb152d1587afa9e9062a1cf9afe54"
    //"dbed3876b22a24cb416c4d310a18693a"
]
//let outData = UserDefaults.standard.value(forKey: "USER") as! Dictionary<String,AnyObject>




//let m=outData["sndr_auth_token"] as! String

//let headers1:HTTPHeaders=["Content-Type":"application/x-www-form-urlencoded"]

var headers1: HTTPHeaders = [
    // "Authorization":auth,
    "Accept": "application/json",
    "Content-Type": "application/json"
]

//var headers01: HTTPHeaders = [
//    // "Authorization":auth,
//    "Accept": "application/json",
//    "Content-Type": "application/json"
]

private extension URL {
    static func getBaseUrl() -> URL {
        guard let info = Bundle.main.infoDictionary,
            let urlString = info["Base url"] as? String,
            let url = URL(string: urlString) else {
                fatalError("Cannot get base url from info.plist")
        }
        return url
    }
}

//func baseURL(url : String) -> String{
//
//    return baseURL.appending(baseURl)
//}

class ApiHelper: NSObject {
    
    public class var sharedInstance: ApiHelper {
        struct Singleton {
            // static let baseUrl : ApiHelper = baseURL(url: <#T##URL#>)
            static let instance : ApiHelper = ApiHelper()
        }
        return Singleton.instance
    }
    
    
    class func requestGETURL(_ strURL: String,headers : [String : String]?, success:@escaping (AFDataResponse<Any>) -> Void, failure:@escaping (Error) -> Void) {
        AF.request(strURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).validate().responseJSON { (responseObject) in
            switch responseObject.result {
            case .success :
                success(responseObject)
            case .failure(let error):
                failure(error)
            }
        }
        
    }
//        AF.request(strURL,method:.get,headers :headers).responseJSON { (responseObject) -> Void in
//
//            if responseObject.result.isSuccess {
//                // let resJson = JSON(responseObject.result.value!)
//                success(responseObject)
//                //    statusCode((responseObject.response?.statusCode)!)
//            }
//            if responseObject.result.isFailure {
//                let error : Error = responseObject.result.error!
//                failure(error)
//            }
//        }
    
//
//
//    class func requestGetURLMaps(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (DataResponse<Any>) -> Void, failure:@escaping (Error) -> Void){
//
//        AF.request(strURL, method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil)
//
//            //        Alamofire.request(strURL, method: .post, parameters: params)
//            .responseJSON { (responseObject) -> Void in
//                switch responseObject.result {
//                case .success :
//                    print("Success")
//                case .failure(let error) :
//                    print(error.localizedDescription)
//                }
//        }
//    }
//
//
    
//    class func requestGETURLHEADERS(_ strURL: String,headers : [String : String]?, success:@escaping (DataResponse<Any>) -> Void, failure:@escaping (Error) -> Void) {
//        AF.request(strURL).responseJSON { (responseObject) -> Void in
//
//            if responseObject.result.isSuccess {
//
//                success(responseObject)
//
//            }
//            if responseObject.result.isFailure {
//                let error : Error = responseObject.result.error!
//                failure(error)
//            }
//        }
//    }
//
//
//
    class func requestPOSTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (AFDataResponse<Any>) -> Void, failure:@escaping (Error) -> Void){

        AF.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)

            //        Alamofire.request(strURL, method: .post, parameters: params)
            .responseJSON { (responseObject) -> Void in
                switch responseObject.result {
                case .success:
                    success(responseObject)
                case .failure(let err):
                    failure(err)
                }
        }
    }
    class func requestDeleteURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (AFDataResponse<Any>) -> Void, failure:@escaping (Error) -> Void){

        AF.request(strURL, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: nil)

            //        Alamofire.request(strURL, method: .post, parameters: params)
            .responseJSON { (responseObject) -> Void in
                switch responseObject.result {
                case .success:
                    success(responseObject)
                case .failure(let err):
                    failure(err)
                }
        }
    }
//
//    class func requestPOSTURLForStripe(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (DataResponse<Any>) -> Void, failure:@escaping (Error) -> Void){
//
//        //        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
//
//        Alamofire.request(strURL, method: .post, parameters: params)
//            .responseJSON {
//                (responseObject) -> Void in
//                if responseObject.result.isSuccess {
//                    success(responseObject)
//                }
//                if responseObject.result.isFailure {
//                    let error : Error = responseObject.result.error!
//                    failure(error)
//                }
//        }
//    }
//
//
    class func requestPUTURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : AnyObject]?, success:@escaping (AFDataResponse<Any>) -> Void, failure:@escaping (Error) -> Void){

        AF.request(strURL, method: .put, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseObject) -> Void in
            switch responseObject.result {
            case .success:
                success(responseObject)
            case .failure(let err):
                failure(err)
            }
        }
    }
//
//    class func requestUpload(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (DataResponse<Any>) -> Void, failure:@escaping (Error) -> Void){
//    }
}
