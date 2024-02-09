//
//  OTPViewModel.swift
//
//
//
//

import Foundation

class OTPViewModel {
    private let apiService = APIService.shared

    func sendOTP(mobileNumber: String, emailID: String, completion: @escaping (Result<String, Error>) -> Void) {
        apiService.sendOTPRequest(mobileNumber: mobileNumber, emailID: emailID, completion: completion)
    }
}
