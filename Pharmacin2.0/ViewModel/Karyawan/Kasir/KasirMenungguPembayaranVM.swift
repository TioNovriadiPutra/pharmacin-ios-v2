//
//  KasirMenungguPembayaranVM.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 16/03/24.
//

import Foundation

class KasirMenungguPembayaranVM: ObservableObject{
    private let nService = NetworkingService()
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
            self.getAntrianKasir() { _, _ in }
        }
    }
    
    // Stop timer
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    //    queue/doctor/consult-wait - getDoctorConsultWait - GET
    func getAntrianKasir(completion: @escaping CompletionHandler){
        let endpoint = "/queue/drug-pick-up"
        print("\(GlobalVariable.authToken)")
        nService.requestGET(endpoint: endpoint, token: GlobalVariable.authToken, expecting: AntrianBayarKasirModel.self)
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
}
