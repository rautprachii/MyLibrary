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

//import UIKit
//
//public class MyLibrary {
//    public static let shared = MyLibrary()
//
//    private init() {}
//
//    public func presentSDK(from viewController: UIViewController) {
//        guard let topViewController = UIApplication.shared.keyWindow?.rootViewController else {
//            return
//        }
//
//        let sdkViewController = MySDKViewController()
//        sdkViewController.onDataReturn = { [weak self] data in
//            self?.handleDataFromSDK(data)
//        }
//
//        topViewController.present(sdkViewController, animated: true, completion: nil)
//    }
//
//    private func handleDataFromSDK(_ data: String) {
//        // Process data received from SDK
//        print("Data received in host application: \(data)")
//        showToast(message: data)
//    }
//
//    private func showToast(message: String) {
//        // Show a toast message in the host application
//        // ...
//    }
//}

// MyLibrary.swift

import UIKit

public class MyLibrary {
    // Singleton instance
    public static let shared = MyLibrary()

    private init() {}

    // Closure to handle data returned from the SDK
    public var onDataReturn: ((String) -> Void)?

    // Present the SDK view controller
    public func presentSDK(from viewController: UIViewController) {
        guard let topViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }

        let sdkViewController = MySDKViewController()
        sdkViewController.onDataReturn = { [weak self] data in
            // Handle data returned from SDK in the host application
            self?.handleDataFromSDK(data)
        }
        topViewController.present(sdkViewController, animated: true, completion: nil)
    }

    // Handle data returned from the SDK
    private func handleDataFromSDK(_ data: String) {
        // Process the data returned from the SDK (e.g., show a toast message)
        print("Data received in host application: \(data)")
        showToast(message: data)
    }

    // Dismiss the SDK view controller
    public func dismissSDK() {
        // Dismiss the topmost view controller if it is presented modally
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController,
           let presentedViewController = topViewController.presentedViewController {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }

    // Helper function to show a simple toast message
    private func showToast(message: String) {
        // ... (unchanged)
    }
}
