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

public class MySDK {
    // Singleton instance
    public static let shared = MySDK()

    private init() {}

    // Present the SDK view controller
    public func presentSDK(from viewController: UIViewController) {
        let sdkViewController = MySDKViewController()
        sdkViewController.onDataReturn = { [weak self] data in
            // Handle data returned from SDK in the host application
            self?.handleDataFromSDK(data)
        }
        viewController.present(sdkViewController, animated: true, completion: nil)
    }

    // Handle data returned from the SDK
    private func handleDataFromSDK(_ data: String) {
        // Process the data returned from the SDK (e.g., show a toast message)
        print("Data received in host application: \(data)")
        showToast(message: data)
    }

    // Dismiss the SDK view controller
    public func dismissSDK() {
        // Add any cleanup code if needed
        // For example, dismiss any presented view controllers
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.dismiss(animated: true, completion: nil)
        }
    }

    // Helper function to show a simple toast message
    private func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor(white: 0, alpha: 0.7)
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true

        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.view.addSubview(toastLabel)

            toastLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                toastLabel.leadingAnchor.constraint(equalTo: topViewController.view.leadingAnchor, constant: 20),
                toastLabel.trailingAnchor.constraint(equalTo: topViewController.view.trailingAnchor, constant: -20),
                toastLabel.bottomAnchor.constraint(equalTo: topViewController.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                toastLabel.heightAnchor.constraint(equalToConstant: 40)
            ])

            UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        }
    }
}


