// MySDKViewController.swift

import UIKit

public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?
    public var onClose: (() -> Void)?

    private let dataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go Back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)

        view.addSubview(goBackButton)
        view.addSubview(dataLabel)

        NSLayoutConstraint.activate([
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),

            dataLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataLabel.heightAnchor.constraint(equalToConstant: 40)
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

