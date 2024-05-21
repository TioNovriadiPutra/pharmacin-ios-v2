//
//  BaseResponse.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 09/05/24.
//

import Foundation

struct BaseResponse:Decodable{
    let message: String
    
    init(message: String) {
        self.message = message
    }
}
