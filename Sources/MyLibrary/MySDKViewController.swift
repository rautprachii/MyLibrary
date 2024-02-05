import UIKit


public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?
       public var onDismiss: (() -> Void)?
       public var onClose: ((String) -> Void)?
    
    
    private let dataLabel: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white

               let openSDKButton = UIButton(type: .system)
               openSDKButton.setTitle("Open SDK", for: .normal)
               openSDKButton.backgroundColor = UIColor.red
               openSDKButton.addTarget(self, action: #selector(openSDKButtonTapped), for: .touchUpInside)

        view.addSubview(openSDKButton)
          
        let goBackButton = UIButton(type: .system)
               goBackButton.setTitle("Go Back", for: .normal)
               goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)

        view.addSubview(goBackButton)
             
             
               view.addSubview(dataLabel)

               // Layout UI components
               NSLayoutConstraint.activate([
                   openSDKButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   openSDKButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),

                   goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),

                   dataLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                   dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   dataLabel.heightAnchor.constraint(equalToConstant: 40)
               ])
        
        

//        // Create a button
//        let closeButton = UIButton(type: .system)
//        closeButton.setTitle("Close SDK", for: .normal)
//        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
//
//        // Add the button to the view
//        view.addSubview(closeButton)
//
//        // Layout button
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//        closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

//    @objc private func closeButtonTapped() {
//        // Send data back to the host application
//        onDataReturn?("Hello")
//
//        // Dismiss the SDK
//        dismiss(animated: true, completion: nil)
//    }
    
    @objc private func openSDKButtonTapped() {
           // Send initial data to host application
           onDataReturn?("Hello")
       }

       @objc private func goBackButtonTapped() {
           // Send modified data back to host application
           let modifiedData = "$the data we sensed that is hello and World"
           onClose?(modifiedData)
           onDismiss?() // Notify the host application upon dismissal
           dismiss(animated: true, completion: nil)
       }

       public func updateDataLabel(withData data: String) {
           // Update label with received data
           dataLabel.text = data
       }
}




