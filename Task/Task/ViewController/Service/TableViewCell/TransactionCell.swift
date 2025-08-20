//
//  TransactionCell.swift
//  Task
//
//  Created by Mac on 19/08/2025.
//

import UIKit

// MARK: - TransactionCell (TableView Cell)
// Represents a single transaction in the history list.

class TransactionCell: UITableViewCell {
    
    static let identifier = "TransactionCell"

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with transaction: Transaction) {
        dateLabel.text = transaction.date
        typeLabel.text = transaction.type
        amountLabel.text = "$\(transaction.amount)"
        
        // Accessibility support for VoiceOver
        accessibilityLabel = "\(transaction.type) on \(transaction.date), amount \(transaction.amount) dollars"
    }
    
}
