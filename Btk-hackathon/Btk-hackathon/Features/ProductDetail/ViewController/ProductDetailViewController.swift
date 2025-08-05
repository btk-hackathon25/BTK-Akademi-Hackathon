//
//  ProductDetailViewController.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class ProductDetailViewController: UIViewController {
    private let detailView = ProductDetailView()
    private let viewModel = ProductDetailViewModel()
    private let productId: Int

    init(productId: Int) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ürün Detayı"
        bindViewModel()
        viewModel.loadProductDetail(productId: productId)
    }

    private func bindViewModel() {
        viewModel.reloadUI = { [weak self] in
            guard let self = self, let product = self.viewModel.product else { return }
            self.detailView.titleLabel.text = product.title
            self.detailView.priceLabel.text = "₺\(Int(product.price))"
            self.detailView.timeLabel.text = self.formatTime(product.timeLeft)
            self.detailView.descriptionLabel.text = product.description
            let url = product.imageUrl
            self.detailView.imageView.loadImage(from: url)


        }
    }

    private func formatTime(_ seconds: TimeInterval) -> String {
        let hrs = Int(seconds) / 3600
        let mins = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hrs, mins, secs)
    }
}
