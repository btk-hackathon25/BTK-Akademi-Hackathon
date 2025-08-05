//
//  ProductDetailView.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class ProductDetailView: UIView {
    let scrollView = UIScrollView()
    let contentStack = UIStackView()

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    let timeLabel = UILabel()
    let descriptionLabel = UILabel()

    let bidTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Teklifinizi girin"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        return tf
    }()

    let bidButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("TEKLİF VER", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
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
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.spacing = 12

        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true

        titleLabel.font = .boldSystemFont(ofSize: 20)
        priceLabel.font = .boldSystemFont(ofSize: 18)
        priceLabel.textColor = .systemBlue

        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .systemRed

        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14)

        let bidStack = UIStackView(arrangedSubviews: [bidTextField, bidButton])
        bidStack.axis = .horizontal
        bidStack.spacing = 8
        bidTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true
        bidButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        bidButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        [imageView, titleLabel, priceLabel, timeLabel, descriptionLabel, bidStack].forEach {
            contentStack.addArrangedSubview($0)
        }

        scrollView.addSubview(contentStack)
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }
}
