// MySDKViewController.swift

import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?
    public var onClose: (() -> Void)?

    
    private let textView: UITextView = {
           let textView = UITextView()
        textView.backgroundColor = .red
           textView.translatesAutoresizingMaskIntoConstraints = false
           textView.isEditable = false
           return textView
       }()
    
   
    public override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .white

       
        
        
        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)

//        view.addSubview(goBackButton)
       
                view.addSubview(textView)
                view.addSubview(goBackButton)
        
        // Set up UITextView constraints
               NSLayoutConstraint.activate([
                   textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                   textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   textView.heightAnchor.constraint(equalToConstant: 100)
               ])
        
        // Set up Go Back button constraints
               goBackButton.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   goBackButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20)
               ])
        
       
//        
//        goBackButton.translatesAutoresizingMaskIntoConstraints = false
//        goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        
        
                 
               
    }

    @objc private func goBackButtonTapped() {
        // Send modified data back to host application
        onDataReturn?("Hello World")
        onClose?() // Notify the host application upon dismissal
        dismiss(animated: true, completion: nil)
    }

    public func updateDataLabel(withData data: String) {
        // Update label with received data
       // dataLabel.text = data
        textView.text = data
        print(data)
    }
}

