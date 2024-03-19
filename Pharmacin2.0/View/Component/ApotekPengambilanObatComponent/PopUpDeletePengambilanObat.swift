//
//  PopUpDeletePengambilanObat.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 11/03/24.
//

import SwiftUI

struct PopUpDeletePengambilanObat: View {
    @Binding var showPopUpPengambilanKasir : Bool
//
//    var deleteAction: () -> Void
//    var pasien: Pasien
//
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    showPopUpPengambilanKasir = false
                }, label: {
                    Image("BackIcon")
                        .padding(.leading,46)
                })
                
                
                Text("Hapus Data?")
                    .font(.custom("PlusJakartaSans-Bold", size: 24))
                    .foregroundColor(Color("RegularText"))
                    .padding(.leading,110)
                
                Spacer()
            }
            .padding(.top,34)
            .padding(.bottom,82)
            
            Text("Tindakan ini tidak dapat dibatalkan.\nApakah Anda yakin ingin menghapus data pada aplikasi?")
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
                    showPopUpPengambilanKasir = false
                }, label: {
                    ActionButton(title: "Batalkan", width: 225, height: 44, radius: 10, bgColor: "Gray")
                })
                
                Button(action: {
                    print("Hapus")
                    showPopUpPengambilanKasir = false
//                    deleteAction()
                }, label: {
                    ActionButton(title: "Hapus", width: 225, height: 44, radius: 10, bgColor: "Red")
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
    PopUpDeletePengambilanObat(showPopUpPengambilanKasir: .constant(true))
}

