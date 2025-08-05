//
//  APIService.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}

    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(sample))
        }
    }
}
