//
//  ProfileViewController.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class ProfileViewController: UIViewController {
    private let profileView = ProfileView()
    private let viewModel = ProfileViewModel()

    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profil"
        bindViewModel()
        setupActions()
        viewModel.loadProfile()
    }

    private func bindViewModel() {
        viewModel.reloadUI = { [weak self] in
            guard let self = self, let profile = self.viewModel.profile else { return }
            self.profileView.usernameLabel.text = profile.username
            self.profileView.emailLabel.text = profile.email
            self.profileView.auctionsLabel.text = "Mezatlarım: \(profile.auctionsCount)"
            self.profileView.purchasesLabel.text = "Satın Aldıklarım: \(profile.purchasesCount)"
            self.profileView.avatarImageView.loadImage(from: profile.avatarUrl)
        }
    }

    private func setupActions() {
        profileView.logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        profileView.myAuctionsButton.addTarget(self, action: #selector(showMyAuctions), for: .touchUpInside)
    }

    @objc private func showMyAuctions() {
        let vc = MyAuctionsViewController(currentUserId: 1) 
        navigationController?.pushViewController(vc, animated: true)
    }


    @objc private func logoutTapped() {
        dismiss(animated: true)
    }
}
