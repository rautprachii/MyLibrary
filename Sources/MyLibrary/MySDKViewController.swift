// MySDKViewController.swift

import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?

    private let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Set up UI
        view.backgroundColor = .white

        let openSDKButton = UIButton(type: .system)
        openSDKButton.setTitle("Open SDK", for: .normal)
        openSDKButton.addTarget(self, action: #selector(openSDKButtonTapped), for: .touchUpInside)

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)

        // Add UI components
        view.addSubview(openSDKButton)
        view.addSubview(goBackButton)
        view.addSubview(textView)

        // Layout UI components
        NSLayoutConstraint.activate([
            openSDKButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openSDKButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),

            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),

            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc private func openSDKButtonTapped() {
        // Send initial data to host application
        onDataReturn?("Hello")
    }

    @objc private func goBackButtonTapped() {
        // Send modified data back to host application
        onDataReturn?("$sendData World")
        dismiss(animated: true, completion: nil)
    }

    public func updateTextView(withData data: String) {
        // Update TextView with received data
        textView.text = data
    }
}
