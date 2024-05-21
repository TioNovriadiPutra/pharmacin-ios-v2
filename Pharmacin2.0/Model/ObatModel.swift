//
//  ObatModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 17/02/24.
//

import Foundation

struct Obat : Codable {
    var id: Int
    var nama: String
    var takaran: String
    var harga: Double
    var qty: Int
    
    init(id: Int, nama: String, takaran: String, harga: Double, qty: Int) {
        self.id = id
        self.nama = nama
        self.takaran = takaran
        self.harga = harga
        self.qty = qty
    }
}

struct Drug: Codable{
    let drug_name: String
    let quantity: Int
    let unit_name: Int
    let instruction: String
    let total_price: Int
    
    init(drug_name: String, quantity: Int, unit_name: Int, instruction: String, total_price: Int) {
        self.drug_name = drug_name
        self.quantity = quantity
        self.unit_name = unit_name
        self.instruction = instruction
        self.total_price = total_price
    }
}
