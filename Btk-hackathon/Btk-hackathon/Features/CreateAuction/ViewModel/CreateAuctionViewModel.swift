//
//  CreateAuctionViewModel.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class CreateAuctionViewModel {
    var onAuctionCreated: (() -> Void)?
    var onError: ((String) -> Void)?
    var onAIPredictionReady: ((String, String) -> Void)? // Başlık + kategori önerisi

    func createAuction(item: AuctionItem) {
        // Normalde API'ye POST isteği atılır
        if item.title.isEmpty || item.startPrice <= 0 || item.images.isEmpty {
            onError?("Lütfen tüm zorunlu alanları doldurun.")
            return
        }

        print("Ürün eklendi: \(item)")
        onAuctionCreated?()
    }

    func predictFromImage(_ image: UIImage) {
        // AI tahmin mantığı (dummy)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.onAIPredictionReady?("Antika Saat", "Antika")
        }
    }
}
