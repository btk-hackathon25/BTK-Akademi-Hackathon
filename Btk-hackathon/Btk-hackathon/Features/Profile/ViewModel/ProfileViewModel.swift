//
//  ProfileViewModel.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import Foundation

final class ProfileViewModel {
    var profile: UserProfile?
    var reloadUI: (() -> Void)?

    func loadProfile() {
        // Normalde API isteği yapılır
        let dummy = UserProfile(
            username: "iremtek",
            email: "test@test.com",
            avatarUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
            auctionsCount: 5,
            purchasesCount: 3
        )
        self.profile = dummy
        reloadUI?()
    }
}
