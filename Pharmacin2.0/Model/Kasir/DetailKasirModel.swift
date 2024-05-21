//
//  DetailKasirModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 22/03/24.
//

import Foundation


struct DetailKasirModel: Codable {
    let message: String
    let data: DataPasien
}

// MARK: - DataPasien
struct DataPasien: Codable {
    let id: Int
    let registration_number, record_number, full_name, ttl: String
    let address, tgl_periksa, doctor_name: String
    let allergy: String?
    let sub_total_price, outpatient_fee, total_price: Int
    let drug_carts: [DrugCart]
    let drug_carts_total_price: Int
    let action_carts: [ActionCart]
    let action_carts_total_price: Int
    let status: String
    
    init(id: Int, registration_number: String, record_number: String, full_name: String, ttl: String, address: String, tgl_periksa: String, doctor_name: String, allergy: String?, sub_total_price: Int, outpatient_fee: Int, total_price: Int, drug_carts: [DrugCart], drug_carts_total_price: Int, action_carts: [ActionCart], action_carts_total_price: Int, status: String) {
        self.id = id
        self.registration_number = registration_number
        self.record_number = record_number
        self.full_name = full_name
        self.ttl = ttl
        self.address = address
        self.tgl_periksa = tgl_periksa
        self.doctor_name = doctor_name
        self.allergy = allergy
        self.sub_total_price = sub_total_price
        self.outpatient_fee = outpatient_fee
        self.total_price = total_price
        self.drug_carts = drug_carts
        self.drug_carts_total_price = drug_carts_total_price
        self.action_carts = action_carts
        self.action_carts_total_price = action_carts_total_price
        self.status = status
    }
}

// MARK: - ActionCart
struct ActionCart: Codable {
    let id: Int
    let action_name: String
    let action_price: Int

    init(id: Int, action_name: String, action_price: Int) {
        self.id = id
        self.action_name = action_name
        self.action_price = action_price
    }
}

// MARK: - DrugCart
struct DrugCart: Codable {
    let id: Int
    let drug_name: String
    let quantity: Int
    let unit_name, instruction: String
    let total_price: Int

    init(id: Int, drug_name: String, quantity: Int, unit_name: String, instruction: String, total_price: Int) {
        self.id = id
        self.drug_name = drug_name
        self.quantity = quantity
        self.unit_name = unit_name
        self.instruction = instruction
        self.total_price = total_price
    }
}
