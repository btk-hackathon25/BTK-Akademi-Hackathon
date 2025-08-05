//
//  CreateAuctionViewController.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class CreateAuctionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let auctionView = CreateAuctionView()
    private let viewModel = CreateAuctionViewModel()
    private var selectedImages: [UIImage] = []

    override func loadView() {
        view = auctionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mezat Başlat"
        setupActions()
        bindViewModel()
    }

    private func setupActions() {
        auctionView.imageButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
        auctionView.createButton.addTarget(self, action: #selector(createAuction), for: .touchUpInside)
    }

    private func bindViewModel() {
        viewModel.onAuctionCreated = { [weak self] in
            let alert = UIAlertController(title: "Başarılı", message: "Mezat başlatıldı.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default) { _ in
                self?.navigationController?.popViewController(animated: true)
            })
            self?.present(alert, animated: true)
        }

        viewModel.onError = { [weak self] message in
            let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            self?.present(alert, animated: true)
        }

        viewModel.onAIPredictionReady = { [weak self] title, category in
            self?.auctionView.titleField.text = title
            self?.auctionView.categoryField.text = category
        }
    }

    @objc private func addPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

    @objc private func createAuction() {
        let item = AuctionItem(
            title: auctionView.titleField.text ?? "",
            description: auctionView.descriptionField.text ?? "",
            category: auctionView.categoryField.text ?? "",
            startPrice: Double(auctionView.startPriceField.text ?? "") ?? 0,
            buyNowPrice: Double(auctionView.buyNowPriceField.text ?? ""),
            duration: [1, 3, 7][auctionView.durationSegment.selectedSegmentIndex],
            images: selectedImages
        )
        viewModel.createAuction(item: item)
    }

    // MARK: - Image Picker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if let image = info[.originalImage] as? UIImage {
            selectedImages.append(image)
            auctionView.imageButton.setBackgroundImage(image, for: .normal)
            auctionView.imageButton.setTitle("", for: .normal)
            viewModel.predictFromImage(image) // AI tahmin çalıştır
        }
    }
}
