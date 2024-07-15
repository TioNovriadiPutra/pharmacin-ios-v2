//
//  ObatModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 17/02/24.
//

import Foundation

struct Obat : Codable, Identifiable {
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

var obatA = Obat(id: 1, nama: "Obat A", takaran: "ml", harga: 10000, qty: 5)
var obatB = Obat(id: 2, nama: "Obat B", takaran: "ml", harga: 20000, qty: 6)
var obatC = Obat(id: 3, nama: "Obat C", takaran: "ml", harga: 30000, qty: 7)
var obatD = Obat(id: 4, nama: "Obat D", takaran: "ml", harga: 10000, qty: 5)
var obatE = Obat(id: 5, nama: "Obat E", takaran: "ml", harga: 20000, qty: 6)
var obatF = Obat(id: 6, nama: "Obat F", takaran: "ml", harga: 30000, qty: 7)
var obatG = Obat(id: 7, nama: "Obat G", takaran: "ml", harga: 10000, qty: 5)
var obatH = Obat(id: 8, nama: "Obat H", takaran: "ml", harga: 20000, qty: 6)
var obatI = Obat(id: 9, nama: "Obat I", takaran: "ml", harga: 30000, qty: 7)
var obatJ = Obat(id: 10, nama: "Obat J", takaran: "ml", harga: 10000, qty: 5)
var obatK = Obat(id: 11, nama: "Obat K", takaran: "ml", harga: 20000, qty: 6)
var obatL = Obat(id: 12, nama: "Obat L", takaran: "ml", harga: 30000, qty: 7)

var obats: [Obat] = [obatA, obatB, obatC, obatD, obatE, obatF, obatG, obatH, obatI, obatJ, obatK, obatL]

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
