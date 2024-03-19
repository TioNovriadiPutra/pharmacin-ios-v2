//
//  SideBarAsistenDokterView.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import SwiftUI


struct SideBarAsistenDokterView: View {
    
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
                    
                    ButtonSideBar(backgroundColor:"Green", image: "RawatPasienIconActive")
                    
                    
                }
                
                Spacer()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 38, height: 1)
                    .background(Color(red: 0.88, green: 0.87, blue: 0.87))
                
                Button(action: {
                    
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

#Preview {
    SideBarAsistenDokterView()
}
