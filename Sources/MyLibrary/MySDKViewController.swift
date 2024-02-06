// MySDKViewController.swift

import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?
    public var onClose: (() -> Void)?
  //  var initialData: String?
    

    
    private let textView: UITextView = {
           let textView = UITextView()
        textView.backgroundColor = .white
           textView.translatesAutoresizingMaskIntoConstraints = false
           textView.isEditable = false
           return textView
       }()
  
//    convenience init(initialData: String?) {
//           self.init(nibName: "MySDKViewController", bundle: nil)
//           self.initialData = initialData
//       }
    
    
   
    public override func viewDidLoad() {
        super.viewDidLoad()

//        textView.text = initialData
        
        view.backgroundColor = .white

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)


       
                view.addSubview(textView)
                view.addSubview(goBackButton)
        
      
               NSLayoutConstraint.activate([
                   textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                   textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   textView.heightAnchor.constraint(equalToConstant: 100)
               ])
        
       
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
    
    
    public func setText(_ text: String) {
        textView.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textView.text = text
        print(text)
    }
    
//    public static func printText(_ text: String) {
//            print("Text from application: \(text)")
//        }
    

    @objc private func goBackButtonTapped() {
        onDataReturn?("Hello World")
        onClose?()
        dismiss(animated: true, completion: nil)
    }
    
    

    public func updateDataLabel(withData data: String) {
        // Update label with received data
       // dataLabel.text = data
        textView.text = data
        print(data)
    }
    
    func handleDataReturn(data: String) {
           onDataReturn?(data)
       }
    
}

