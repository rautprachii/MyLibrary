 //The Swift Programming Language

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
//}


// MySDK.swift

import UIKit

public class MyLibrary {

    // Singleton instance
    public static let shared = MyLibrary()

    // Closure to handle data return
    public var onDataReturn: ((String) -> Void)?

    private init() {}

    // Function to present the SDK UI
    public func presentSDK(from viewController: UIViewController) {
        let sdkViewController = MySDKViewController()
        sdkViewController.onDataReturn = { [weak self] data in
            self?.onDataReturn?(data)
        }
        viewController.present(sdkViewController, animated: true, completion: nil)
    }
}
