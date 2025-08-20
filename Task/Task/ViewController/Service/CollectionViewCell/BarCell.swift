//
//  BarCell.swift
//  Task
//
//  Created by Mac on 19/08/2025.
//

import UIKit

// MARK: - BarCell (CollectionView Cell)
// Displays one month's spend as a vertical bar in the bar chart.

class BarCell: UICollectionViewCell {
    
    static let identifier = "BarCell"
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var barHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        barView.layer.cornerRadius = 6
        barView.clipsToBounds = true
    }
    
    func configure(with month: String, amount: Double, maxAmount: Double) {
        monthLabel.text = month
        lblPrice.text = "$\(Int(amount))"
        
        let ratio = amount / maxAmount
        let height = CGFloat(120 * ratio)
        
        barHeightConstraint.constant = height
        
        // Accessibility support for VoiceOver
        barView.accessibilityLabel = "\(month) spending \(amount) dollars"
    }
}
