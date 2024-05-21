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
    private let token = UserDefaultService.shared.getToken()
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    var signInVM = SignInViewModel()
    
    
    @Published var pasienList: [Pasien] = []
    @Published var antrianSekarang : String?
    @Published var antrianSelanjutnya: String?
    @Published var sisaAntrian: Int?
    
    private var timer: Timer?
    
    init() {
        // Start timer when ViewModel is initialized
        startTimer()
    }
    
    deinit {
        // Invalidate timer when ViewModel is deallocated
        stopTimer()
    }
    
    // Start timer to fetch data every 5 seconds if pasienList is empty
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] timer in
            guard let self = self else { return }
                self.getAntrianPasien() { _, _ in }
        }
    }
    
    // Stop timer
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    //    queue/doctor/consult-wait - getDoctorConsultWait - GET
    func getAntrianPasien(completion: @escaping CompletionHandler){
        let endpoint = "/queue/consult-wait"
        nService.requestGET(endpoint: endpoint, token: token, expecting: RawatPasienModel.self)
        {result in
            DispatchQueue.main.async {
                switch result{
                case.success(let respon):
                    let pasienData = respon.data.queue
                    let sisaPasien = respon.data.total
                    self.sisaAntrian = sisaPasien
                    self.pasienList = pasienData
                    if self.pasienList.count != 0{
                        self.antrianSelanjutnya = respon.data.queue[0].registration_number
                    }
                    completion(respon.message,true)
                    
                case.failure(let error):
                    print(error.localizedDescription)
                    completion(nil, false)
                }
            }
        }
    }
    
    func deleteAntrianPasien(id:Int, completion: @escaping CompletionHandler) {
        let endpoint = "/queue/cancel/\(id)" // Sesuaikan dengan endpoint yang sesuai untuk menghapus antrian pasien
        
        nService.requestDELETE(endpoint: endpoint, parameters: [:], token: token, expecting: BaseResponse.self)
        { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Jika penghapusan berhasil, Anda dapat menangani respons sesuai kebutuhan.
                    completion(response.message, true)
                case .failure(let error):
                    // Jika terjadi kesalahan saat melakukan permintaan DELETE, tangani kesalahan tersebut.
                    print(error.localizedDescription)
                    completion(nil, false)
                }
            }
        }
    }
    
    func panggilPasien(id:Int, completion: @escaping CompletionHandler) {
        let endpoint = "/queue/consult-wait/\(id)" // Sesuaikan dengan endpoint yang sesuai untuk menghapus antrian pasien
        nService.requestPATCH(endpoint: endpoint, parameters: [:], token: token, expecting: BaseResponse.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Jika penghapusan berhasil, Anda dapat menangani respons sesuai kebutuhan.
                    completion(response.message, true)
                    print(response.message)
                    
                    self.antrianSekarang = response.message
                    
                case .failure(let error):
                    // Jika terjadi kesalahan saat melakukan permintaan DELETE, tangani kesalahan tersebut.
                    print(error.localizedDescription)
                    completion(nil, false)
                }
            }
        }
    }
}
