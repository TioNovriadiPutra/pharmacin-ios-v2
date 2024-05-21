//
//  AntrianBayarKasirModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 16/03/24.
//

import Foundation

struct AntrianBayarKasirModel: Codable {
    let message: String
    let data: [Pasien]
    
    init(message: String, data: [Pasien]) {
        self.message = message
        self.data = data
    }
}
