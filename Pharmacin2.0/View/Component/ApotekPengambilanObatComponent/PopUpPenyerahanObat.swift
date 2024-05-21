//
//  PopUpPenyerahanObat.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct PopUpPenyerahanObat: View {
    
    var pasien: DataPasienApotek
    var konfirmasiPenyerahan: () -> Void
    @Binding var showPopUpPenyerahanObat: Bool
    
    var body: some View {
        VStack{
            
            Image("InfoIcon")
           
            Text("Konfirmasi Penyerahan")
                    .font(.custom("PlusJakartaSans-Bold", size: 24))
                    .foregroundColor(Color("RegularText"))
            Spacer()
            
            VStack(alignment:.center){
                Text("Lakukan penyerahan obat")
                    
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
                    showPopUpPenyerahanObat = false
                }label: {
                    ActionButton(title: "Batalkan", width: 245, height: 44, radius: 10, bgColor: "Gray")
                        .padding(.bottom,20)
                    
                }
                
                Button{
                    konfirmasiPenyerahan()
                    showPopUpPenyerahanObat = false
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
//    PopUpPenyerahanObat()
//}
