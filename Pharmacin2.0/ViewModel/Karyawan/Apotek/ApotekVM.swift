//
//  ApotekVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 21/05/24.
//

import Foundation

class ApotekVM: ObservableObject{
    private let nService = NetworkingService()
    private let token = UserDefaultService.shared.getToken()
    
    typealias CompletionHandler = (_ message: String?, _ success:Bool)->Void
    
    @Published var pasienList: [Pasien] = []
    
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
            self.getAntrianApotek() { _, _ in }
        }
    }
    
    // Stop timer
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    //    queue/doctor/consult-wait - getDoctorConsultWait - GET
    func getAntrianApotek(completion: @escaping CompletionHandler){
        let endpoint = "/queue/payment"
        nService.requestGET(endpoint: endpoint, token: token, expecting: AntrianPengambilanObatModel.self)
        {result in
            DispatchQueue.main.async {
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
    
}
