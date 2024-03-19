//
//  SignInVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 23/02/24.
//

import Foundation

class SignInViewModel : ObservableObject{
    @Published var token: String?
    @Published var error: [String]?
    @Published var errorMessage: String?
    @Published var successMessage: String?
    @Published var roleID: Int?
    @Published var isSignedIn: Bool?
    
    private let nService = NetworkingService()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    
    func getData(endpoint:String, param:[String:Any], token:String? ,completion: @escaping CompletionHandler) {
        nService.requestPOST(endpoint: endpoint, parameters: param, token: token, expecting: SignInModel.self)
        { [weak self] result in
            switch result {
            case .success(let response):
                // Handle successful response
                self?.token = response.token.token
                GlobalVariable.authToken = response.token.token
                self?.roleID = response.roleId
                self?.successMessage = response.message
                
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
