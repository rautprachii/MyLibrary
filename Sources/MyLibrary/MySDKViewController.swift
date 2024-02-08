// MySDKViewController.swift

import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?
    public var onClose: (() -> Void)?
  //  var initialData: String?
    
    public static let shared = MySDKViewController()

      private var labelText: String = ""
    
    private let label: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.textAlignment = .center
          return label
      }()

    
//    private let label: UILabel = {
//           let label = UILabel()
//        label.backgroundColor = .yellow
//        label.translatesAutoresizingMaskIntoConstraints = false
//      //  label.isEditable = false
//           return label
//       }()
  
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


       
                view.addSubview(label)
                view.addSubview(goBackButton)
        
      
               NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                label.heightAnchor.constraint(equalToConstant: 100)
               ])
        
       
               goBackButton.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   goBackButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
               ])
        
        
      
       
//        
//        goBackButton.translatesAutoresizingMaskIntoConstraints = false
//        goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
    }
    
   
    
    public func setText(_ text: String, textColor: UIColor = .black) {
        labelText = text // Store the text value
               label.text = text
               label.textColor = textColor
        print("text is \(text)")
    }
    
    
    public func getText() -> String {
            return labelText
        }
    
//    public static func printText(_ text: String) {
//            print("Text from application: \(text)")
//        }
    

    @objc private func goBackButtonTapped() {
//        let textToPass = MySDKViewController.shared.getText()
//           onDataReturn?("Hello World")
//        onClose?()
//        dismiss(animated: true, completion: nil)
        
        
        let textToPass = MySDKViewController.shared.getText()
            let updatedText = textToPass + " World" 
            onDataReturn?(updatedText)
            onClose?()
            dismiss(animated: true, completion: nil)
        
    }
    
    

    public func updateDataLabel(withData data: String) {
        // Update label with received data
       // dataLabel.text = data
        label.text = data
        print(data)
    }
    
//    func handleDataReturn(data: String) {
//           onDataReturn?(data)
//       }
    
    
//    func getVerification(){
//        let url = "https://uatselfonboarding.utkarsh.bank/app/send-otp"
//      
//        let param : Parameters = [
//            
//            "mobile_no:": 9665494024,
//            "rating": "ajinkyamandavkar92@gmail.com",
//        ]
//     
//        ApiHelper.requestPOSTURL(url, params: param as [String : AnyObject], headers: nil, success: { (responseSucess) in
//            print(responseSucess)
//            
//        }) { (responseFailure) in
//            print(responseFailure)
//        }
//    }
    
 
    func sendOTP() {
        // API Endpoint
        let apiURL = URL(string: "https://uatselfonboarding.utkarsh.bank/app/send-otp")!

        // Request Headers
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("app", forHTTPHeaderField: "request-type")
        request.addValue("7c4eb152d1587afa9e9062a1cf9afe54", forHTTPHeaderField: "signature-value")

        // Request Parameters
        let params: [String: Any] = [
            "mobile_no": 7822922745,
            "email_id": "rprachi9797@gmail.com"
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch {
            print("Error serializing JSON: \(error)")
            return
        }

        // Make the API Call
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let data = data {
                // Process the response data if needed
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response JSON: \(json)")
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }

        task.resume()
    }


    
   
    
}

