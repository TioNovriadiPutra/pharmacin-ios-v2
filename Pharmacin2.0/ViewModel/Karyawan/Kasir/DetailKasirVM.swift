//
//  DetailKasirVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 22/03/24.
//

import Foundation

class DetailKasirVM: ObservableObject{
    private let nService = NetworkingService()
    private let token = UserDefaultService.shared.getToken()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    @Published var pasienId: Int?
    
    @Published var pasien: DataPasien?
    
    
    //    queue/doctor/consult-wait - getDoctorConsultWait - GET
    func getDetailKasir(id:Int, completion: @escaping CompletionHandler){
        let endpoint = "/transaction/selling/\(id)"
        nService.requestGET(endpoint: endpoint, token: token, expecting: DetailKasirModel.self)
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
    
    func konfirmasiPembayaran(id:Int, completion: @escaping CompletionHandler) {
        let endpoint = "/transaction/selling/payment/\(id)" // Sesuaikan dengan endpoint yang sesuai untuk menghapus antrian pasien
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
    
    func deleteDrugItem(id:Int, completion: @escaping CompletionHandler) {
        let endpoint = "/transaction/selling/cart/\(id)" // Sesuaikan dengan endpoint yang sesuai untuk menghapus antrian pasien
        nService.requestDELETE(endpoint: endpoint, parameters: [:], token: token, expecting: BaseResponse.self) { result in
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
