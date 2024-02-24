//
//  ErrorResponse2.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import Foundation

struct ErrorResponse2:Decodable, LocalizedError{
    let error: error2
}

struct error2: Codable{
    let message: String
    let code: String
    let status: Int
}
