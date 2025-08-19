//
//  Models.swift
//  Task
//
//  Created by Wasiq Tayyab on 19/08/2025.
//

import Foundation

struct Service {
    let name: String
    let category: String
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

struct MockData {
    static let netflix = Service(
        name: "Netflix",
        category: "Streaming",
        logoName: "netflix", // Put an image named "netflix" in Assets.xcassets
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
