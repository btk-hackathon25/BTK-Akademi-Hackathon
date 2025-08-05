//
//  ProfileView.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class ProfileView: UIView {
    let scrollView = UIScrollView()
    let stack = UIStackView()

    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 50
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let usernameLabel = UILabel()
    let emailLabel = UILabel()
    let auctionsLabel = UILabel()
    let purchasesLabel = UILabel()

    let logoutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Çıkış Yap", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 8
        return btn
    }()

    let myAuctionsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Satıştaki Ürünlerim", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .center

        usernameLabel.font = .boldSystemFont(ofSize: 20)
        emailLabel.font = .systemFont(ofSize: 14)
        auctionsLabel.font = .systemFont(ofSize: 16)
        purchasesLabel.font = .systemFont(ofSize: 16)

        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        stack.addArrangedSubview(avatarImageView)
        stack.addArrangedSubview(usernameLabel)
        stack.addArrangedSubview(emailLabel)
        stack.addArrangedSubview(auctionsLabel)
        stack.addArrangedSubview(purchasesLabel)
        stack.addArrangedSubview(myAuctionsButton)
        stack.addArrangedSubview(logoutButton)

        scrollView.addSubview(stack)
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
