//
//  LoginViewModel.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation

final class LoginViewModel {
    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: ((String) -> Void)?

    func login(email: String, password: String) {
        // Basit demo mantığı — normalde API isteği yapılır
        if email == "test@test.com" && password == "123456" {
            onLoginSuccess?()
        } else {
            onLoginFailure?("E-posta veya şifre hatalı.")
        }
    }
}
