//
//  File.swift
//  
//
//  Created by Fermion Mac 2022 - 1 on 08/02/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let structVerification = try? JSONDecoder().decode(StructVerification.self, from: jsonData)

import Foundation

// MARK: - StructVerification
struct StructVerification: Codable {
    let msg, ack, mobileOtpCount, emailOtpCount: String?

    enum CodingKeys: String, CodingKey {
        case msg, ack
        case mobileOtpCount = "Mobile_otp_count"
        case emailOtpCount = "Email_otp_count"
    }
}
