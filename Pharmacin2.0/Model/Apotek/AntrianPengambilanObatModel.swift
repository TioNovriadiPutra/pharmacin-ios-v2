//
//  AntrianPengambilanObatModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 21/05/24.
//

import Foundation

struct AntrianPengambilanObatModel: Codable {
    let message: String
    let data: [Pasien]
    
    init(message: String, data: [Pasien]) {
        self.message = message
        self.data = data
    }
}
