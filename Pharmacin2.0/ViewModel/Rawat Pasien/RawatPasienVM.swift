//
//  RawatPasienVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 01/03/24.
//

import Foundation
import SwiftUI

class RawatPasienVM: ObservableObject{
    private let nService = NetworkingService()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    var signInVM = SignInViewModel()
    
    
    @Published var pasienList: [Pasien] = []
    
    func getAntrianPasien(completion: @escaping CompletionHandler){
        let endpoint = "/queue/consult-wait"
        print("\(GlobalVariable.authToken)")
        nService.requestGET(endpoint: endpoint, token: GlobalVariable.authToken, expecting: RawatPasienModel.self)
        {result in
            switch result{
            case.success(let respon):
                let pasienData = respon.data
                self.pasienList = pasienData
                completion(respon.message,true)
                
            case.failure(let error):
                print(error.localizedDescription)
                completion(nil, false)
            }
        }
    }
}
