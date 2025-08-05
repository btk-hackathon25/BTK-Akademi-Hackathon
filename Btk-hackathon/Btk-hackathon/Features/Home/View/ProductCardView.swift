//
//  ProductCardView.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class ProductCardView: UICollectionViewCell {
    static let identifier = "ProductCardView"

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setupUI() {
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        priceLabel.font = .systemFont(ofSize: 14, weight: .bold)
        priceLabel.textColor = .systemBlue

        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "₺\(Int(product.price))"
        imageView.loadImage(from: product.imageUrl)
    }
}
