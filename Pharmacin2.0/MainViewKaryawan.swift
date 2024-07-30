//
//  ContentView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct MainViewKaryawan: View {
    @State private var activeView: ActiveView = .Dashboard
    
    @State private var isLoading = false
    
    @State private var logOut = false
    var onLogout: (Int) -> Void
    @EnvironmentObject var signInViewModel: SignInViewModel
    @StateObject var logOutVM = LogOutViewModel()
    @State private var showFailedToast = false
    @State private var failedToastMessage = ""
    
    
    var body: some View {
        //        NavigationStack{
        GeometryReader { geometry in
            ZStack {
                
                
                VStack{
                    HStack(spacing:0){
                        SidebarKaryawanView(activeView: $activeView, logOut: $logOut)
                        
                        
                        getViewForActiveView()
                        
                        Spacer()
                    }.background( Color(red: 0.98, green: 0.98, blue: 0.99))
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
        switch activeView {
        case .Dashboard:
            DashboardView()
        case .Kasir:
            KasirView()
            
        case .Apotek:
            ApotekPengambilanObatView()
        }
    }
    
}

//struct MainViewKaryawan_Preview: PreviewProvider {
//    static var previews: some View {
//        MainViewKaryawan().previewInterfaceOrientation(.landscapeRight)
//    }
//}
