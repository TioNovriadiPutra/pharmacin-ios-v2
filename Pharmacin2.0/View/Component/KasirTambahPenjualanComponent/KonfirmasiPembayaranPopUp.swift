//
//  KonfirmasiPembayaranPopUp.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct KonfirmasiPembayaranPopUp: View {
    //@Binding var showSelesaiPembayaranPopup: Bool
    
    var body: some View {
        VStack{
            HStack{
                
                Button(action: {
                    
                }, label: {
                    Image("BackIcon")
                        .padding(.leading,40)
                })
                
                
                Text("Konfirmasi Pembayaran")
                    .font(.custom("PlusJakartaSans-Bold", size: 24))
                    .foregroundColor(Color("RegularText"))
                    .padding(.leading,70)
                
                Spacer()
            }
            
            Text("Total Pembelian")
                .font(.custom("PlusJakartaSans-medium", size: 16))
                .foregroundColor(Color("Gray"))
                .padding()
            
            Text("9999")
                .font(.custom("PlusJakartaSans-Bold", size: 24))
                .foregroundColor(Color("RegularText"))
            
            Text("Tunai")
                .font(.custom("PlusJakartaSans-medium", size: 16))
                .foregroundColor(Color("Gray"))
                .padding()
            
            Text("9999")
                .font(.custom("PlusJakartaSans-Bold", size: 24))
                .foregroundColor(Color("Green"))
            
            
            
            Text("Kembalian")
                .font(.custom("PlusJakartaSans-medium", size: 16))
                .foregroundColor(Color("Gray"))
                .padding()
            Text("9999")
                .font(.custom("PlusJakartaSans-Bold", size: 24))
                .foregroundColor(Color("Red"))
            
            Divider()
                .padding()
            
            Button{
                //showSelesaiPembayaranPopup = true
            }label: {
                ActionButton(title: "Konfirmasi", width: 450, height: 44, radius: 10, bgColor: "Green")
                
            }
            
        }
        .padding(.top,20)
        .frame(width: 542, height: 522)
        .background(.white)
        .cornerRadius(10)
        
    }
}

#Preview {
    KonfirmasiPembayaranPopUp()
}
