//
//  ErrorResponse.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 23/02/24.
//

import Foundation

struct ErrorResponse:Decodable, LocalizedError{
    let error: error1
}

struct error1: Codable{
    let message: [error]
    let status: Int
    let code: String
}

struct error: Codable{
    let message: String
    let rule: String
    let field: String
}


