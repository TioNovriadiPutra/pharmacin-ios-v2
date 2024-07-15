//
//  DetailApotekModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 21/05/24.
//

import Foundation

struct DetailApotekModel: Codable {
    let message: String
    let data: DataPasienApotek
}

// MARK: - DataPasien
struct DataPasienApotek: Codable {
    let id: Int
    let registration_number, record_number, full_name, ttl: String
    let address, tgl_periksa, doctor_name: String
    let allergy: String?
//    let sub_total_price, outpatient_fee, total_price: Int
    let drug_carts: [DrugCart]
    let drug_carts_total_price: Int
    let status: String
    
    init(id: Int, registration_number: String, record_number: String, full_name: String, ttl: String, address: String, tgl_periksa: String, doctor_name: String, allergy: String?, sub_total_price: Int, outpatient_fee: Int, total_price: Int, drug_carts: [DrugCart], drug_carts_total_price: Int, status: String) {
        self.id = id
        self.registration_number = registration_number
        self.record_number = record_number
        self.full_name = full_name
        self.ttl = ttl
        self.address = address
        self.tgl_periksa = tgl_periksa
        self.doctor_name = doctor_name
        self.allergy = allergy
//        self.sub_total_price = sub_total_price
//        self.outpatient_fee = outpatient_fee
//        self.total_price = total_price
        self.drug_carts = drug_carts
        self.drug_carts_total_price = drug_carts_total_price
        self.status = status
    }
}
