//
//  ContentView.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var roleID: Int? // Menyimpan roleID setelah login
    @EnvironmentObject var viewModel: SignInViewModel
    @State var showSplash: Bool = false
    
    var body: some View {
        ZStack{
            if self.showSplash {
                if UserDefaultService.shared.getToken() != ""{
                    if UserDefaultService.shared.getId() == 3{
                        MainViewKaryawan(onLogout: { roleID in
                            self.roleID = UserDefaultService.shared.getId()
                            checkUserDefault()
                        })
                    }else if UserDefaultService.shared.getId() == 4{
                        MainViewAsistenDokter(onLogout: { roleID in
                            self.roleID = UserDefaultService.shared.getId()
                            checkUserDefault()
                        })
                    }
                }else{
                    LoginView(onLogin: { roleID in
                        self.roleID = UserDefaultService.shared.getId()
                        checkUserDefault()
                    })
                }
            }else{
                SplashScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.showSplash = true
                }
            }
        }
        .onChange(of: roleID) { newValue, _ in
            print("Telah melakukan proses Login")
        }
        
        
        
        
        
    }
    private func checkUserDefault() {
        if let userID = UserDefaultService.shared.getId() {
            print("RoleID saat ini: \(userID)")
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
