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

// MyLibrary.swift

import UIKit

public class MyLibrary {
    public static let shared = MyLibrary()

    private init() {}

    public func presentSDK(from viewController: UIViewController) {
        guard let topViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }

        let sdkViewController = MySDKViewController()
        sdkViewController.onDataReturn = { [weak self] data in
            self?.handleDataFromSDK(data)
        }

        topViewController.present(sdkViewController, animated: true, completion: nil)
    }

    private func handleDataFromSDK(_ data: String) {
        // Process data received from SDK
        print("Data received in host application: \(data)")
        showToast(message: data)
    }

    private func showToast(message: String) {
        // Show a toast message in the host application
        // ...
    }
}
