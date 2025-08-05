//
//  CreateAuctionView.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class CreateAuctionView: UIView {
    let scrollView = UIScrollView()
    let stack = UIStackView()

    let imageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("📷 Fotoğraf Ekle", for: .normal)
        btn.backgroundColor = .systemGray5
        btn.layer.cornerRadius = 8
        return btn
    }()

    let titleField = CreateAuctionView.createTextField(placeholder: "Ürün Başlığı")
    let categoryField = CreateAuctionView.createTextField(placeholder: "Kategori")
    let descriptionField = CreateAuctionView.createTextField(placeholder: "Açıklama")
    let startPriceField = CreateAuctionView.createTextField(placeholder: "Başlangıç Fiyatı (₺)", keyboard: .decimalPad)
    let buyNowPriceField = CreateAuctionView.createTextField(placeholder: "Hemen Al Fiyatı (Opsiyonel)", keyboard: .decimalPad)

    let durationSegment: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["1 Gün", "3 Gün", "7 Gün"])
        seg.selectedSegmentIndex = 0
        return seg
    }()

    let createButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Mezatı Başlat", for: .normal)
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

    static func createTextField(placeholder: String, keyboard: UIKeyboardType = .default) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.borderStyle = .roundedRect
        tf.keyboardType = keyboard
        return tf
    }

    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16

        [imageButton, titleField, categoryField, descriptionField,
         startPriceField, buyNowPriceField, durationSegment, createButton].forEach {
            stack.addArrangedSubview($0)
        }

        scrollView.addSubview(stack)
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),

            imageButton.heightAnchor.constraint(equalToConstant: 150),
            createButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
