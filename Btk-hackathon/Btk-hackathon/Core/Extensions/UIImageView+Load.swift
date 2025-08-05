//
//  UIImageView+Load.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = img
                }
            }
        }
    }
}
