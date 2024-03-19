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

//struct antrianKasir: Codable{
//        let id: Int
//        let registration_number : String
//        let full_name: String
//        let record_number : String
//        let status: String
//    
//        init(id: Int, registration_number: String, full_name: String, record_number: String, status: String) {
//            self.id = id
//            self.registration_number = registration_number
//            self.full_name = full_name
//            self.record_number = record_number
//            self.status = status
//        }
//}

//struct Pasien: Codable, Identifiable{
//    let id: Int
//    let registration_number : String
//    let full_name: String
//    let record_number : String
//    let status: String
//    
//    init(id: Int, registration_number: String, full_name: String, record_number: String, status: String) {
//        self.id = id
//        self.registration_number = registration_number
//        self.full_name = full_name
//        self.record_number = record_number
//        self.status = status
//    }
//}





//struct Token: Codable {
//    let type: String
//    let name: String?
//    let token: String
//    let abilities: [String]
//    let lastUsedAt: String? // Jika nilainya null, Anda bisa gunakan tipe String dan atur nilainya ke nil saat inisialisasi
//    let expiresAt: String? // Jika nilainya null, Anda bisa gunakan tipe String dan atur nilainya ke nil saat inisialisasi
//
//    init(type: String, name: String?, token: String, abilities: [String], lastUsedAt: String?, expiresAt: String?) {
//        self.type = type
//        self.name = name
//        self.token = token
//        self.abilities = abilities
//        self.lastUsedAt = lastUsedAt
//        self.expiresAt = expiresAt
//    }
//}

//struct PanggilPasien: Codable {
//    let message: String
//    
//    init(message: String) {
//        self.message = message
//    }
//
//}
//
//struct DeteleQueuePasien: Codable {
//    let message: String
//    
//    init(message: String) {
//        self.message = message
//    }
//
//}
