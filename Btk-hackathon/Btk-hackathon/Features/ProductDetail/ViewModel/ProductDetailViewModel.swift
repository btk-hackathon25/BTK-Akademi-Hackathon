//
//  ProductDetailViewModel.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation

final class ProductDetailViewModel {
    var product: Product?
    var reloadUI: (() -> Void)?

    func loadProductDetail(productId: Int) {
        // Normalde API isteği ile detay alınır
        let sample = Product(
            id: productId,
            title: "Antika Masa Saati",
            price: 1250,
            timeLeft: 3600,
            imageUrl: "https://example.com/clock1.jpg",
            stars: 5,
            ownerId: 1,
            description: "1930'lardan kalma, çalışır durumda antika masa saati.",
            shippingInfo: "Kargo ücretsizdir, 2 iş günü içinde teslim."
        )
        self.product = sample
        reloadUI?()
    }
}
