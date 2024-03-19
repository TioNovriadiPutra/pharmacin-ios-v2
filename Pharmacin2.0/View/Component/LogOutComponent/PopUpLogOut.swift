//
//  PopUpLogOut.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 10/03/24.
//

import SwiftUI

struct PopUpLogOut: View {
    @Binding var showLogoutPopUp : Bool
    
//    var deleteAction: () -> Void
//    var pasien: Pasien
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    showLogoutPopUp = false
                }, label: {
                    Image("BackIcon")
                        .padding(.leading,46)
                })
                
                
                Text("Keluar Akun?")
                    .font(.custom("PlusJakartaSans-Bold", size: 24))
                    .foregroundColor(Color("RegularText"))
                    .padding(.leading,110)
                
                Spacer()
            }
            .padding(.top,34)
            .padding(.bottom,82)
            
            Text("Tekan tombol “Keluar” untuk logout dari akun Anda dan kembali ke halaman login.")
                .font(.custom("PlusJakartaSans-Medium", size: 16))
                .foregroundColor(Color("Gray"))
                .multilineTextAlignment(.center)
                .padding(.bottom,56)
                
            
            
            Divider()
                .padding(.horizontal)
            
            Spacer()
            HStack(spacing:24){
                Button(action: {
                    print("Batalkan")
                    showLogoutPopUp = false
                }, label: {
                    ActionButton(title: "Batalkan", width: 225, height: 44, radius: 10, bgColor: "Gray")
                })
                
                Button(action: {
                    print("Keluar")
                    showLogoutPopUp = false
                }, label: {
                    ActionButton(title: "Keluar", width: 225, height: 44, radius: 10, bgColor: "Red")
                })
                
            }
            
            Spacer()
            
        }
        
        .frame(width: 542, height: 336)
        .background(.white)
        .cornerRadius(10)
    }
}

#Preview {
    PopUpLogOut(showLogoutPopUp: .constant(false))
}
