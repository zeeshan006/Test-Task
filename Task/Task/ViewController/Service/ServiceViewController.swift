//
//  ServiceViewController.swift
//  Task
//
//  Created by Mac on 19/08/2025.
//

import UIKit

// MARK: - Main Service Screen
// Displays subscription details including header, monthly spending chart, upcoming charges, and transaction history.

class ServiceViewController: UIViewController {
    
    // MARK: - Properties
    private let service = MockData.netflix
    
    // MARK: - Outlets
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var upcomingView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        backButtonBorder()
        setupCategory()
        setupUpcoming()
    }
    
    // MARK: - Setup Methods
    private func setup() {
        amountLabel.text = "$\(service.upcomingCharge.amount)"
        
        let collectionNib = UINib(nibName: BarCell.identifier, bundle: nil)
        collectionView.register(collectionNib, forCellWithReuseIdentifier: BarCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 15
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout

        let nib = UINib(nibName: TransactionCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TransactionCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func backButtonBorder() {
        btnBack.layer.cornerRadius = btnBack.bounds.height / 2
        btnBack.layer.borderColor = UIColor(named: "grayColor")?.cgColor
        btnBack.layer.borderWidth = 2.0
        btnBack.clipsToBounds = true
    }
    
    private func setupCategory() {
        headerImage.image = UIImage(named: service.logoName)
        headerImage.layer.cornerRadius = headerImage.bounds.height / 2
        headerImage.clipsToBounds = true
        
        let fullText = "You've spent this year so far for Netflix (Streaming)"
        let boldWord = "Netflix"
        
        let attributedText = NSMutableAttributedString(string: fullText, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor.secondaryLabel
        ])
        
        if let range = fullText.range(of: boldWord) {
            let nsRange = NSRange(range, in: fullText)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: nsRange)
        }
        
        categoryLabel.attributedText = attributedText
    }
    
    private func setupUpcoming() {
        upcomingView.layer.cornerRadius = 20
        upcomingLabel.numberOfLines = 0
        upcomingLabel.textAlignment = .center

        let dateText = service.upcomingCharge.date
        let amountText = "$\(service.upcomingCharge.amount)"
        let fullText = "Coming up \(dateText) for \(amountText)"

        let attributedText = NSMutableAttributedString(
            string: fullText,
            attributes: [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .foregroundColor: UIColor.secondaryLabel
            ]
        )

        if let range = fullText.range(of: dateText) {
            attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.label], range: NSRange(range, in: fullText))
        }


        if let range = fullText.range(of: amountText) {
            attributedText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.label], range: NSRange(range, in: fullText))
        }

        upcomingLabel.attributedText = attributedText
    }
}

// MARK: - CollectionView (Monthly Spending Chart)
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

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 160)
    }
}

// MARK: - TableView (Transaction History)
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

