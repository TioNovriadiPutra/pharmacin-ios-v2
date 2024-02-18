//
//  ObatModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 17/02/24.
//

import Foundation

struct Obat : Codable {
    var nama: String
    var takaran: String
    var harga: Double
    var qty: Int
    
    init(nama: String, takaran: String, harga: Double, qty: Int) {
        self.nama = nama
        self.takaran = takaran
        self.harga = harga
        self.qty = qty
    }
}
