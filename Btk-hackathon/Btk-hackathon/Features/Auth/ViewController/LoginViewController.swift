//
//  LoginViewController.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class LoginViewController: UIViewController {
    private let loginView = LoginView()
    private let viewModel = LoginViewModel()

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Giriş Yap"
        bindViewModel()
        loginView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }

    private func bindViewModel() {
        viewModel.onLoginSuccess = { [weak self] in
            self?.navigateToHome()
        }

        viewModel.onLoginFailure = { [weak self] message in
            let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            self?.present(alert, animated: true)
        }
    }

    @objc private func loginTapped() {
        guard let email = loginView.emailField.text, !email.isEmpty,
              let password = loginView.passwordField.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Hata", message: "Tüm alanları doldurun.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            present(alert, animated: true)
            return
        }

        viewModel.login(email: email, password: password)
    }

    private func navigateToHome() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())

        let tabBar = UITabBarController()
        tabBar.viewControllers = [homeVC, profileVC]

        homeVC.tabBarItem = UITabBarItem(title: "Keşfet", image: UIImage(systemName: "house"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "Profil", image: UIImage(systemName: "person.circle"), tag: 1)

        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }

}
