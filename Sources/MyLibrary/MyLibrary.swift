// MyLibrary.swift

import UIKit


public class MyLibrary {

    public static let shared = MyLibrary()
    public var sdkViewController: MySDKViewController?

    private init() {}

    public var onDataReturn: ((String) -> Void)?

    // Present the SDK view controller with initial data
    public func presentSDK(from viewController: UIViewController, withData data: String) {
        let sdkViewController = MySDKViewController.shared
        sdkViewController.setText(data) // Set the data in the SDK
        sdkViewController.onDataReturn = { [weak self] receivedData in
            self?.handleDataFromSDK(receivedData)
        }
        sdkViewController.onClose = { [weak self] in
            self?.handleSDKClosure()
        }
        viewController.present(sdkViewController, animated: true, completion: nil)
    }

    // Show toast message in the application
    private func handleDataFromSDK(_ data: String) {
        print("Data received in application: \(data)")
        showToast(message: data)
        
    }

//    public func verifyOTP(from verificationOTPViewController: UIViewController, otp: String, emailOTP: String, consent: String, mobileNumber: String, emailID: String, latitude: String, longitude: String) {
//           let sdkViewController = MySDKViewController.shared
//           sdkViewController.verifyOTPRequest(otp: otp, emailOTP: emailOTP, consent: consent, mobileNumber: mobileNumber, emailID: emailID, latitude: latitude, longitude: longitude)
//       }
    
    private func handleSDKClosure() {
        print("SDK closed")
    }

    public func showToast(message: String) {
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

            UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        }
    }
}

