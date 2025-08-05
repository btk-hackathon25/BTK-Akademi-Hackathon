//
//  MyAuctionsViewController.swift
//  Btk-hackathon
//
//  Created by iremt on 5.08.2025.
//


import UIKit

final class MyAuctionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private let currentUserId: Int
    private var myProducts: [Product] = []

    init(currentUserId: Int) {
        self.currentUserId = currentUserId
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Satıştaki Ürünlerim"
        view.backgroundColor = .systemBackground

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        loadMyProducts()
    }

    private func loadMyProducts() {
        // Normalde API’den sadece bu kullanıcıya ait ürünler çekilir
        let allProducts = [
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

        myProducts = allProducts.filter { $0.ownerId == currentUserId }

        if myProducts.isEmpty {
            let label = UILabel()
            label.text = "Henüz satışa sunduğunuz ürün bulunmamaktadır."
            label.textAlignment = .center
            label.textColor = .gray
            label.frame = view.bounds
            tableView.backgroundView = label
        } else {
            tableView.reloadData()
        }
    }

    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = myProducts[indexPath.row]
        cell.textLabel?.text = "\(product.title) - ₺\(Int(product.price)) - ⭐️\(product.stars)"
        return cell
    }
}
