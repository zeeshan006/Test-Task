//
//  BarCell.swift
//  Task
//
//  Created by Wasiq Tayyab on 19/08/2025.
//

import Foundation
import UIKit

class BarCell: UICollectionViewCell {
    static let identifier = "BarCell"

    private let barView = UIView()
    private let monthLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        barView.backgroundColor = UIColor.systemBlue
        barView.layer.cornerRadius = 6
        barView.translatesAutoresizingMaskIntoConstraints = false

        monthLabel.font = .systemFont(ofSize: 12, weight: .medium)
        monthLabel.textAlignment = .center
        monthLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(barView)
        contentView.addSubview(monthLabel)

        NSLayoutConstraint.activate([
            barView.bottomAnchor.constraint(equalTo: monthLabel.topAnchor, constant: -4),
            barView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 20),

            monthLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            monthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            monthLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with month: String, amount: Double, maxAmount: Double) {
        monthLabel.text = month

        let ratio = amount / maxAmount
        let height = CGFloat(100 * ratio)

        barView.heightAnchor.constraint(equalToConstant: height).isActive = true
        barView.accessibilityLabel = "\(month) spending \(amount) dollars"
    }
}
