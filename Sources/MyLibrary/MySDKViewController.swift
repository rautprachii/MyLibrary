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
    
    
//    func VerificationApi(){
//        let url = "https://uatselfonboarding.utkarsh.bank/app/send-otp"
//      
//        let param : Parameters = [
//            
//            "mobile_no:": mobileNo,
//            "rating": "emailId",
//        ]
    
 
   
    func sendOTP(mobileNumber: String, email: String, completion: @escaping (Result<String, Error>) -> Void) {
            let apiUrl = "https://uatselfonboarding.utkarsh.bank/app/send-otp"
            
            guard let url = URL(string: apiUrl) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let params: [String: Any] = [
                "mobile_no": mobileNumber,
                "email_id": email
                // Add any other parameters as needed
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params)
            } catch {
                completion(.failure(error))
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let msg = json?["msg"] as? String {
                        completion(.success(msg))
                    } else {
                        completion(.failure(NSError(domain: "Invalid JSON format", code: 0, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
   
    
}

