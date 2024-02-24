//
//  SignInModel.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 23/02/24.
//

import Foundation

struct SignInModel: Codable {
    let message: String
    let token: Token
    let paymentStatus: Int
    let roleId: Int
    
    init(message: String, token: Token, paymentStatus: Int, roleId: Int) {
        self.message = message
        self.token = token
        self.paymentStatus = paymentStatus
        self.roleId = roleId
    }
}

struct Token: Codable {
    let type: String
    let name: String?
    let token: String
    let abilities: [String]
    let lastUsedAt: String? // Jika nilainya null, Anda bisa gunakan tipe String dan atur nilainya ke nil saat inisialisasi
    let expiresAt: String? // Jika nilainya null, Anda bisa gunakan tipe String dan atur nilainya ke nil saat inisialisasi
    
    init(type: String, name: String?, token: String, abilities: [String], lastUsedAt: String?, expiresAt: String?) {
        self.type = type
        self.name = name
        self.token = token
        self.abilities = abilities
        self.lastUsedAt = lastUsedAt
        self.expiresAt = expiresAt
    }
}

