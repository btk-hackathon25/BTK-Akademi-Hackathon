//
//  HomeViewController.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class HomeViewController: UIViewController {
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mezat AI"
        view.backgroundColor = .systemBackground
        setupCollectionView()
        bindViewModel()
        viewModel.loadProducts()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                title: "Ekle",
                style: .plain,
                target: self,
                action: #selector(addAuction)
            )
    }

    private func bindViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func showMostStarredProduct() {
        if let topProduct = viewModel.mostStarredProduct() {
            let alert = UIAlertController(title: "En Popüler Ürün", message: "\(topProduct.title) - ⭐️\(topProduct.stars)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            present(alert, animated: true)
        }
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2 - 16, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ProductCardView.self, forCellWithReuseIdentifier: ProductCardView.identifier)

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func addAuction() {
        let vc = CreateAuctionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCardView.identifier, for: indexPath) as! ProductCardView
        cell.configure(with: viewModel.products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = viewModel.products[indexPath.row]
        let detailVC = ProductDetailViewController(productId: product.id)
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
