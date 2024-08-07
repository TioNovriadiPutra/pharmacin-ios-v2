//
//  MainViewAsistenDokter.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import SwiftUI

struct MainViewAsistenDokter: View {
    @EnvironmentObject var toastManager: ToastManager
    @State private var showingPopUpRawatPasienDelete = false
    @State private var showingPopUpPanggilPasien = false
    
    @State private var pasienToCall: Pasien?
    
    @StateObject var viewModel = RawatPasienVM()
    
    @State private var antrianSekarang = "-"
    
    @State private var refreshView = false
    
    @State private var logOut = false
    
    @State private var isLoading = false

    @EnvironmentObject var signInViewModel: SignInViewModel
    @StateObject var logOutVM = LogOutViewModel()
    
    @State private var showFailedToast = false
    @State private var failedToastMessage = ""
    
    var onLogout: (Int) -> Void
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {

                VStack{
                    HStack(spacing:0){
                        SideBarAsistenDokterView(logOut: $logOut)
                        
                        
                        getViewForActiveView()
                        
                        Spacer()
                    }.background( Color(red: 0.98, green: 0.98, blue: 0.99))
                }
                
                
                if showingPopUpRawatPasienDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpRawatPasienDelete = false
                        }
                    
                    confirmDeletePopUp(tutupPopUp: $showingPopUpRawatPasienDelete, deleteAction: {
                        deleteQueuePasien()
                    })
                }
                
                if showingPopUpPanggilPasien {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpRawatPasienDelete = false
                        }
                    
                    PanggilanPasienPopUp(showPanggilPasienPopUp: $showingPopUpPanggilPasien, pasien: pasienToCall!, panggilAction: {
                        panggilPasien()
                    })
                }
                
                if logOut {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            logOut = false
                        }
                    PopUpLogOut(showLogoutPopUp: $logOut, logOutAcc: {
                        logOutAcc()
                    })
          
                }

                
                if showFailedToast{
                    FailedToast(message: failedToastMessage)
                }
                
            }.ignoresSafeArea(.keyboard)
            .loadingView(isLoading: $isLoading)
        }

    }
    


    
    private func deleteQueuePasien(){
        viewModel.deleteAntrianPasien(id: pasienToCall?.id ?? 0) { message, success in
            if success {
                print(message ?? "")
                toastManager.show(message: message ?? "")
                refreshView = true
            } else {
                failedToastMessage = "Gagal menghapus antrian"
                showFailedToast = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showFailedToast = false
                    }
                }
               print(failedToastMessage)
            }
        }
    }
    
    private func panggilPasien(){
        viewModel.panggilPasien(id: pasienToCall?.id ?? 0) { message, success in
            if success {
                print(message ?? "Unknown error")
                toastManager.show(message: "Berhasil memanggil pasien")
                self.antrianSekarang = message ?? "-"
                refreshView = true
            } else {
                failedToastMessage = "Gagal memanggil pasien"
                showFailedToast = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showFailedToast = false
                    }
                }
               print(failedToastMessage)
            }
        }

    }
    
    private func logOutAcc(){
        isLoading = true
        logOutVM.logOutAkun() { message, success in
            isLoading = false
            if success {
                UserDefaultService.shared.deleteToken()
                UserDefaultService.shared.deleteRoleId()
                onLogout(UserDefaultService.shared.getId() ?? 0)
            } else {
                failedToastMessage = "Logout gagal"
                showFailedToast = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showFailedToast = false
                    }
                }
               print(failedToastMessage)
            }
        }

    }
    
    @ViewBuilder
    func getViewForActiveView() -> some View {
        RawatPasienView(showPopUpDelete: $showingPopUpRawatPasienDelete, showPanggilPasienPopUp: $showingPopUpPanggilPasien, refreshView: $refreshView, antrianSekarang: $antrianSekarang, selectedPasien: $pasienToCall)

    }
}

//struct MainView_Preview: PreviewProvider {
//    static var previews: some View {
//        MainViewAsistenDokter().previewInterfaceOrientation(.landscapeRight)
//    }
//}
