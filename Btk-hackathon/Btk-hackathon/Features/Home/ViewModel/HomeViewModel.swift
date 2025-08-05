//
//  HomeViewModel.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation

final class HomeViewModel {
    var products: [Product] = []
    var reloadData: (() -> Void)?

    func loadProducts() {
        let sample = [
            Product(
                id: 1,
                title: "Antika Masa Saati",
                price: 1250,
                timeLeft: 3600,
                imageUrl: "https://example.com/clock.jpg",
                stars: 5,
                ownerId: 1,
                description: "1930'lardan kalma, çalışır durumda antika masa saati.",
                shippingInfo: "Kargo ücretsizdir, 2 iş günü içinde teslim."
            ),
            Product(
                id: 2,
                title: "Koleksiyon Kamera",
                price: 2500,
                timeLeft: 7200,
                imageUrl: "https://example.com/camera.jpg",
                stars: 8,
                ownerId: 2,
                description: "Nadir bulunan koleksiyon kamerası, mükemmel durumda.",
                shippingInfo: "Alıcı ödemeli kargo, 3 iş günü içinde teslim."
            )
        ]
        self.products = sample
        reloadData?()
    }

    func toggleStar(for productId: Int) {
        if let index = products.firstIndex(where: { $0.id == productId }) {
            products[index].stars += 1
            reloadData?()
        }
    }

    func mostStarredProduct() -> Product? {
        return products.sorted(by: { $0.stars > $1.stars }).first
    }
}
