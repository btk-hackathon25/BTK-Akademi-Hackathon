//
//  AuctionItem.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation
import UIKit

struct AuctionItem {
    var title: String
    var description: String
    var category: String
    var startPrice: Double
    var buyNowPrice: Double?
    var duration: Int // gün cinsinden
    var images: [UIImage]
}
