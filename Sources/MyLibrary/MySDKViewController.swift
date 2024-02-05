//
//  File.swift
//  
//
//  Created by Fermion Mac 2022 - 1 on 05/02/24.
//

import Foundation
import UIKit


public class MySDKViewController: UIViewController {

    public var onDataReturn: ((String) -> Void)?

    private let dataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Set up UI
        view.backgroundColor = .white

        let openSDKButton = UIButton(type: .system)
        openSDKButton.setTitle("Open SDK", for: .normal)
        openSDKButton.backgroundColor = UIColor.black
        openSDKButton.addTarget(self, action: #selector(openSDKButtonTapped), for: .touchUpInside)

        let goBackButton = UIButton(type: .system)
        goBackButton.setTitle("Go back", for: .normal)
        goBackButton.addTarget(self, action: #selector(goBackButtonTapped), for: .touchUpInside)

        // Add UI components
        view.addSubview(openSDKButton)
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

    public func updateDataLabel(withData data: String) {
        // Update label with received data
        dataLabel.text = data
    }
}
