//
//  Product.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation

struct Product: Identifiable {
    let id: Int
    let title: String
    let price: Double
    let timeLeft: TimeInterval
    let imageUrl: String
    var stars: Int
    let ownerId: Int
    let description: String
    let shippingInfo: String
}
