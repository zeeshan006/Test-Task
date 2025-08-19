//
//  ServiceViewController.swift
//  Task
//
//  Created by Wasiq Tayyab on 19/08/2025.
//

import UIKit

class ServiceViewController: UIViewController {
    private let service = MockData.netflix

    private let headerImage = UIImageView()
    private let titleLabel = UILabel()
    private let categoryLabel = UILabel()
    private let amountLabel = UILabel()
    private let upcomingLabel = UILabel()

    private let collectionView: UICollectionView
    private let tableView = UITableView()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = service.name

        setupHeader()
        setupChart()
        setupUpcoming()
        setupTable()
    }

    private func setupHeader() {
        headerImage.image = UIImage(named: service.logoName)
        headerImage.contentMode = .scaleAspectFit
        headerImage.layer.cornerRadius = 20
        headerImage.clipsToBounds = true

        titleLabel.text = service.name
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)

        categoryLabel.text = service.category
        categoryLabel.font = .systemFont(ofSize: 14, weight: .regular)
        categoryLabel.textColor = .secondaryLabel

        amountLabel.text = "$\(service.upcomingCharge.amount)"
        amountLabel.font = .systemFont(ofSize: 32, weight: .bold)

        let headerStack = UIStackView(arrangedSubviews: [headerImage, titleLabel, categoryLabel, amountLabel])
        headerStack.axis = .vertical
        headerStack.alignment = .center
        headerStack.spacing = 4
        headerStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(headerStack)
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupChart() {
        collectionView.register(BarCell.self, forCellWithReuseIdentifier: BarCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }

    private func setupUpcoming() {
        upcomingLabel.text = "Coming up \(service.upcomingCharge.date) for $\(service.upcomingCharge.amount)"
        upcomingLabel.font = .systemFont(ofSize: 16, weight: .medium)
        upcomingLabel.textAlignment = .center
        upcomingLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(upcomingLabel)
        NSLayoutConstraint.activate([
            upcomingLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 12),
            upcomingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            upcomingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func setupTable() {
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: upcomingLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ServiceViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service.monthlySpending.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BarCell.identifier, for: indexPath) as! BarCell
        let data = service.monthlySpending[indexPath.item]
        let maxAmount = service.monthlySpending.map { $0.amount }.max() ?? 1
        cell.configure(with: data.month, amount: data.amount, maxAmount: maxAmount)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 140)
    }
}

extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.identifier, for: indexPath) as! TransactionCell
        cell.configure(with: service.transactions[indexPath.row])
        return cell
    }
}
