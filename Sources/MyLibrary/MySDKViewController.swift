import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Create a button
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close SDK", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        // Add the button to the view
        view.addSubview(closeButton)

        // Layout button
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc private func closeButtonTapped() {
        // Send data back to the host application
        onDataReturn?("Hello")

        // Dismiss the SDK
        dismiss(animated: true, completion: nil)
    }
}

