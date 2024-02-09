//
//  File.swift
//  
//
//  Created by Fermion Mac 2022 - 1 on 08/02/24.
//

import Foundation


class APIService {
    static let shared = APIService()

    func sendOTPRequest(mobileNumber: String, emailID: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "https://uatselfonboarding.utkarsh.bank/app/send-otp"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Request-Type": "app",
            "Signature-Value": "7c4eb152d1587afa9e9062a1cf9afe54"
        ]

        let parameters: [String: Any] = [
            "mobile_no": mobileNumber,
            "email_id": emailID
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any] {
                        print("API Response: \(json)")

                        if let message = json["msg"] as? String {
                            completion(.success(message))
                            print("msg is \(message)")
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
                    print("API Error: \(error.localizedDescription)")
                }
            }
    }
}
