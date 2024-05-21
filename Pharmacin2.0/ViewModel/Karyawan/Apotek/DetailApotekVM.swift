//
//  DetailApotekVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 21/05/24.
//

import Foundation

class DetailApotekVM: ObservableObject{
    private let nService = NetworkingService()
    private let token = UserDefaultService.shared.getToken()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    @Published var pasienId: Int?
    
    @Published var pasien: DataPasienApotek?
    
    
    //    queue/doctor/consult-wait - getDoctorConsultWait - GET
    func getDetailApotek(id:Int, completion: @escaping CompletionHandler){
        let endpoint = "/transaction/selling/pharmacy/\(id)"
        nService.requestGET(endpoint: endpoint, token: token, expecting: DetailApotekModel.self)
        {result in
            DispatchQueue.main.async {
                switch result{
                case.success(let respon):
                    let pasienId = respon.data.id
                    self.pasienId = pasienId
                    let pasien = respon.data
                    self.pasien = pasien
                    completion(respon.message,true)
                    
                case.failure(let error):
                    print(error.localizedDescription)
                    completion(nil, false)
                }
            }
        }
    }
    
    func konfirmasiPenyerahanObat(id:Int, completion: @escaping CompletionHandler) {
        let endpoint = "/transaction/selling/pharmacy/\(id)" // Sesuaikan dengan endpoint yang sesuai untuk menghapus antrian pasien
        nService.requestPATCH(endpoint: endpoint, parameters: [:], token: token, expecting: BaseResponse.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Jika penghapusan berhasil, Anda dapat menangani respons sesuai kebutuhan.
                    completion(response.message, true)
                    print(response.message)
                case .failure(let error):
                    // Jika terjadi kesalahan saat melakukan permintaan DELETE, tangani kesalahan tersebut.
                    print(error.localizedDescription)
                    completion(nil, false)
                }
            }
        }
    }
}
