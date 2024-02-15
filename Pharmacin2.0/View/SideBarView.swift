//
//  SideBarView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

enum ActiveView {
    case Dashboard, RawatPasien, Kasir, Apotek
}

struct SidebarView: View {
    @Binding var activeView: ActiveView
    @State private var isActiveDashboard = false
    @State private var isActiveRawatPasien = false
    @State private var isActiveKasir = false
    @State private var isActiveApotek = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 68)
                .cornerRadius(10)
            
            VStack(spacing:24){
                VStack{
                    Image("PharmacinLogo")
                }
                VStack(spacing: 14) {
                    
                    Button(action: {
                        activeView = .Dashboard
                        isActiveDashboard = true
                        isActiveRawatPasien = false
                        isActiveKasir = false
                        isActiveApotek = false
                    }) {
                        if activeView == .Dashboard{
                            ButtonSideBar(backgroundColor: "Green", image: "DashboardIconActive")
                        }else{
                            ButtonSideBar(backgroundColor: "backgroundIcon", image: "DashboardIcon")
                        }
                        
                    }
                    
                    Button(action: {
                        activeView = .RawatPasien
                        isActiveDashboard = false
                        isActiveRawatPasien = true
                        isActiveKasir = false
                        isActiveApotek = false
                    }) {
                        ButtonSideBar(backgroundColor: isActiveRawatPasien ? "Green" : "backgroundIcon", image: isActiveRawatPasien ? "RawatPasienIconActive" : "RawatPasienIcon")
                    }
                    
                    Button(action: {
                        activeView = .Kasir
                        isActiveDashboard = false
                        isActiveRawatPasien = false
                        isActiveKasir = true
                        isActiveApotek = false
                    }) {
                        ButtonSideBar(backgroundColor: isActiveKasir ? "Green" : "backgroundIcon", image: isActiveKasir ? "KasirIconActive" : "KasirIcon")
                    }
                    
                    Button(action: {
                        activeView = .Apotek
                        isActiveDashboard = false
                        isActiveRawatPasien = false
                        isActiveKasir = false
                        isActiveApotek = true
                    }) {
                        ButtonSideBar(backgroundColor: isActiveApotek ? "Green" : "backgroundIcon", image: isActiveApotek ? "ApotekIconActive" : "ApotekIcon")
                    }
                    
                }
                
                Spacer()
            }
            .padding(.top,24)
            
        }
        .ignoresSafeArea()
       
        
        
        
    }
}

struct SideBarView_Preview: PreviewProvider {
    static var previews: some View {
        SidebarView(activeView: .constant(.Dashboard)).previewInterfaceOrientation(.landscapeRight)
    }
}
