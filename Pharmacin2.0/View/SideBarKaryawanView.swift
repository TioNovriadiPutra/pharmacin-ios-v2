//
//  SideBarView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

enum ActiveView {
    case Dashboard, Kasir, Apotek
}

struct SidebarKaryawanView: View {
    @Binding var activeView: ActiveView
    @State private var isActiveDashboard = false
    @State private var isActiveKasir = false
    @State private var isActiveApotek = false
    @Binding var logOut : Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 68)
                .cornerRadius(10)
            
            VStack(spacing:24){
                VStack{
                    Image("PharmacinLogo")
                        .padding(.top,24)
                }
                VStack(spacing: 14) {
                    
                    Button(action: {
                        activeView = .Dashboard
                        isActiveDashboard = true
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
                        activeView = .Kasir
                        isActiveDashboard = false
                        isActiveKasir = true
                        isActiveApotek = false
                    }) {
                        ButtonSideBar(backgroundColor: isActiveKasir ? "Green" : "backgroundIcon", image: isActiveKasir ? "KasirIconActive" : "KasirIcon")
                    }
                    
                    Button(action: {
                        activeView = .Apotek
                        isActiveDashboard = false
                        isActiveKasir = false
                        isActiveApotek = true
                    }) {
                        ButtonSideBar(backgroundColor: isActiveApotek ? "Green" : "backgroundIcon", image: isActiveApotek ? "ApotekIconActive" : "ApotekIcon")
                    }
                    
                }
                
                Spacer()
                
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 38, height: 1)
                .background(Color(red: 0.88, green: 0.87, blue: 0.87))

                Button(action: {
                    logOut = true
                }) {
                   Image("Logout")
                        .padding(.bottom,10)
                }
            }
            .padding(.vertical)
            
        }
        .ignoresSafeArea()
       
        
        
        
    }
}

struct SideBarView_Preview: PreviewProvider {
    static var previews: some View {
        SidebarKaryawanView(activeView: .constant(.Dashboard), logOut: .constant(false)).previewInterfaceOrientation(.landscapeRight)
    }
}
