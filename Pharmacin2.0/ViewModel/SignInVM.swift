//
//  SignInVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 23/02/24.
//

import Foundation

class SignInViewModel : ObservableObject{
    @Published var error: [String]?
    @Published var errorMessage: String?
    @Published var successMessage: String?
    @Published var roleID: Int?
    
    private let nService = NetworkingService()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    
    func getData(email: String, password: String, completion: @escaping CompletionHandler) {
        let param = ["email": email, "password": password]
        let endpoint = "/auth/login/mobile"
        nService.requestPOST(endpoint: endpoint, parameters: param, token: nil, expecting: SignInModel.self)
        { [weak self] result in
            switch result {
            case .success(let response):
                // Handle successful response
                let token = response.token.token
                UserDefaultService.shared.saveToken(token)
                UserDefaultService.shared.saveId(response.roleId)
                self?.roleID = response.roleId
                self?.successMessage = response.message
                
                print("-------------")
                print(token)
                print("-------------")
                
                completion(response.message, true)
                print(response.message)
                
            case .failure(let error):
                // Handle failure response
                if let errorResponse = error as? ErrorResponse {
                    // If error is of type ErrorResponse, extract error message and set it to errorMessage
                    let message = errorResponse.error.message.map { $0.message }.joined(separator: "\n")
                    self?.errorMessage = message
                    print(self?.errorMessage ?? "KOSONG")
                    completion(nil, false)
                    
                } 
                
                else if let errorResponse = error as? ErrorResponse2 {
                    // If error is of type ErrorResponse, extract error message and set it to errorMessage
                    let message = errorResponse.error.message
                    self?.errorMessage = message
                    print(self?.errorMessage ?? "KOSONG")
                    completion(nil, false)
                    
                }
                
                else {
                    // If error is of any other type, set localizedDescription as errorMessage
                    let errorMessage = error.localizedDescription
                    self?.errorMessage = errorMessage
                    completion(nil, false)
                }
                
            }
        }
    }
}
