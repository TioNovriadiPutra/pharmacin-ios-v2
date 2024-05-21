//
//  LogOutVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 18/05/24.
//

import Foundation

class LogOutViewModel : ObservableObject{
    
    private let nService = NetworkingService()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    private let token = UserDefaultService.shared.getToken()
    
    func logOutAkun(completion: @escaping CompletionHandler){
        let endpoint = "/auth/logout"
        nService.requestGET(endpoint: endpoint, token: token, expecting: BaseResponse.self)
        {result in
            DispatchQueue.main.async {
                switch result{
                case.success(let respon):
                    completion(respon.message,true)
                case.failure(let error):
                    print(error.localizedDescription)
                    completion(nil, false)
                }
            }
        }
    }
    
}
