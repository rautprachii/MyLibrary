//// The Swift Programming Language
//
//public struct MyLibrary{
//    var text = "Hello, World"
//    
//    public init(){
//        
//    }
//    
//    public func HelloToYou() -> String{
//        return text
//    }
//    
//  
//   
//}
//
//


import Foundation

public struct MyLibrary {
    public init() {}

    public func openSDK(withData data: String, completion: @escaping (String) -> Void) {
      
        let processedData = processDataFromSDK(data: data)
        completion(processedData)
    }

    private func processDataFromSDK(data: String) -> String {
        return data
    }

    public func goBack(completion: @escaping (String) -> Void) {
        let sendData = "Hello"
        completion("\(sendData) World")
    }
}
