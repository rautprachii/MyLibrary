// MySDKViewController.swift

import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?
    public var onClose: (() -> Void)?

   
    public override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .white

    
        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)

        view.addSubview(goBackButton)
        
        
       
        
//        goBackButton.translatesAutoresizingMaskIntoConstraints = false
//        goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate([
                   goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

               ])
    }

    @objc private func goBackButtonTapped() {
        // Send modified data back to host application
        onDataReturn?("Hello World")
        onClose?() // Notify the host application upon dismissal
        dismiss(animated: true, completion: nil)
    }

    public func updateDataLabel(withData data: String) {
        // Update label with received data
        dataLabel.text = data
    }
}

