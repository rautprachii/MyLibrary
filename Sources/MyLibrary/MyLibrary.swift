// MyLibrary.swift

import UIKit

public class MyLibrary {
  
    public static let shared = MyLibrary()

    private init() {}

    
    public var onDataReturn: ((String) -> Void)?

    // Present the SDK view controller
    public func presentSDK(from viewController: UIViewController) {
        let sdkViewController = MySDKViewController()
        sdkViewController.onDataReturn = { [weak self] data in
            // Handle data returned from SDK in the host application
            self?.handleDataFromSDK(data)
        }
        sdkViewController.onClose = { [weak self] in
            // Handle SDK closure
            self?.handleSDKClosure()
        }
        viewController.present(sdkViewController, animated: true, completion: nil)
    }

    // show toast msg
    private func handleDataFromSDK(_ data: String) {
        print("Data received in application: \(data)")
        showToast(message: data)
    }

    
    private func handleSDKClosure() {
        print("SDK closed")
    }

  
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

