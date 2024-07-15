//
//  DashboardModel.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 05/07/24.
//

import Foundation

struct DashboardModel: Codable {
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let report: [Report]
    let selling: [Selling]
    let cashier: [Cashier]
}

// MARK: - Cashier
struct Cashier: Codable {
    let date, open, close: String
}

// MARK: - Report
struct Report: Codable {
    let total_transaction, total_transaction_price, total_patient, rest_patient: Int
}

// MARK: - Selling
struct Selling: Codable {
    let invoice_number: String
    let total_price: Int
}
