//
//  TransactionCell.swift
//  Task
//
//  Created by Wasiq Tayyab on 19/08/2025.
//

import Foundation
import UIKit

class TransactionCell: UITableViewCell {
    static let identifier = "TransactionCell"

    private let dateLabel = UILabel()
    private let typeLabel = UILabel()
    private let amountLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        dateLabel.font = .systemFont(ofSize: 14, weight: .medium)
        typeLabel.font = .systemFont(ofSize: 12, weight: .regular)
        typeLabel.textColor = .secondaryLabel
        amountLabel.font = .systemFont(ofSize: 14, weight: .semibold)

        let stack = UIStackView(arrangedSubviews: [dateLabel, typeLabel])
        stack.axis = .vertical
        stack.spacing = 2

        let container = UIStackView(arrangedSubviews: [stack, amountLabel])
        container.axis = .horizontal
        container.distribution = .equalSpacing
        container.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(container)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with transaction: Transaction) {
        dateLabel.text = transaction.date
        typeLabel.text = transaction.type
        amountLabel.text = "$\(transaction.amount)"
        accessibilityLabel = "\(transaction.type) on \(transaction.date), amount \(transaction.amount) dollars"
    }
}
