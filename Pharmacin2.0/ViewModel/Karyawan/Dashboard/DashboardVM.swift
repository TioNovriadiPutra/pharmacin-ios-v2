//
//  DashboardVM.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 05/07/24.
//

import Foundation

class DashboardVM: ObservableObject{
    private let nService = NetworkingService()
    private let token = UserDefaultService.shared.getToken()
    
    typealias CompletionHandler = (_ message: String?, _ success:Bool, _ data:DashboardModel?)->Void
    
    @Published var pasienList: [Pasien] = []
    
    func getDataDashboard(completion: @escaping CompletionHandler){
        let endpoint = "/clinic/report"
        nService.requestGET(endpoint: endpoint, token: token, expecting: DashboardModel.self)
        {result in
            DispatchQueue.main.async {
                switch result{
                case.success(let respon):
                    completion(respon.message,true, respon)
                case.failure(let error):
                    print(error.localizedDescription)
                    completion(nil, false, nil)
                }
            }
        }
    }
}
