//
//  Models.swift
//  Task
//
//  Created by Mac on 19/08/2025.
//

import Foundation

// MARK: - Data Models
// Define the structures that represent a subscription service, monthly spending, charges, and transactions.

struct Service {
    let name: String
    let logoName: String
    let monthlySpending: [MonthlySpend]
    let upcomingCharge: Charge
    let transactions: [Transaction]
}

struct MonthlySpend {
    let month: String
    let amount: Double
}

struct Charge {
    let date: String
    let amount: Double
}

struct Transaction {
    let date: String
    let type: String
    let amount: Double
}

// MARK: - Mock Data
// Example dataset to populate the UI

struct MockData {
    static let netflix = Service(
        name: "Netflix",
        logoName: "netflix",
        monthlySpending: [
            MonthlySpend(month: "Nov", amount: 12),
            MonthlySpend(month: "Dec", amount: 10),
            MonthlySpend(month: "Jan", amount: 20),
            MonthlySpend(month: "Feb", amount: 14),
            MonthlySpend(month: "Mar", amount: 16),
            MonthlySpend(month: "Apr", amount: 10),
            MonthlySpend(month: "May", amount: 12)
        ],
        upcomingCharge: Charge(date: "Tomorrow", amount: 12),
        transactions: [
            Transaction(date: "May 2", type: "Subscription", amount: 12),
            Transaction(date: "Apr 2", type: "Subscription", amount: 10),
            Transaction(date: "Mar 25", type: "Subscription", amount: 4),
            Transaction(date: "Mar 2", type: "Subscription", amount: 12)
        ]
    )
}
