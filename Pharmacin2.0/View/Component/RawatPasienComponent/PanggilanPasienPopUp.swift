//
//  PanggilanPasienPopUp.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import SwiftUI

struct PanggilanPasienPopUp: View {
    @Binding var showPanggilPasienPopUp : Bool
    var pasien: Pasien
    var body: some View {
        VStack{
            
            Image("InfoIcon")
           
            Text("Panggilan Pasien")
                    .font(.custom("PlusJakartaSans-Bold", size: 24))
                    .foregroundColor(Color("RegularText"))
            Spacer()
                   
            
// REG/20230910/0012 dengan nama Muhammad Naufal Athallahardi Bin Dawood
            
            VStack(alignment:.center){
                Text("Lakukan pemanggilan pasien")
                    
                    .font(.custom("PlusJakartaSans-Regular", size: 16))
                    .foregroundColor(Color("RegularText"))
                +
                Text(" \(pasien.registration_number)")
                    .font(.custom("PlusJakartaSans-Bold", size: 18))
                    .foregroundColor(Color("RegularText"))
                +
                Text(" dengan nama")
                    .font(.custom("PlusJakartaSans-Regular", size: 16))
                    .foregroundColor(Color("RegularText"))
                
                Text("\(pasien.full_name)")
                    .font(.custom("PlusJakartaSans-Bold", size: 18))
                    .foregroundColor(Color("RegularText"))
                    
            }
            .frame(width:394)
            
                
            
            
            
            Spacer()
            Divider()
                .padding()
            
            HStack(spacing:24){
                Button{
                    showPanggilPasienPopUp = false
                }label: {
                    ActionButton(title: "Batalkan", width: 245, height: 44, radius: 10, bgColor: "Gray")
                        .padding(.bottom,20)
                    
                }
                
                Button{
                    showPanggilPasienPopUp = false
                }label: {
                    ActionButton(title: "Lanjutkan", width: 245, height: 44, radius: 10, bgColor: "Green")
                        .padding(.bottom,20)
                    
                }
            }
            
            
            
        }
        .padding(.top,20)
        .frame(width: 542, height: 422)
        .background(.white)
        .cornerRadius(10)

    }
}

//#Preview {
//    PanggilanPasienPopUp(showPanggilPasienPopUp: .constant(true), pasien: Pasien)
//}
