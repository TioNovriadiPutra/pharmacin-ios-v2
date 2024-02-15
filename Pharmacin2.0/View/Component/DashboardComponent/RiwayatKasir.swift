//
//  RiwayatKasir.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct RiwayatKasirCart: View {
    var body: some View {
            
        VStack(spacing:24){
                    HStack{
                        Text("Riwayat Kasir")
                            .font(.custom("PlusJakartaSans-semiBold", size: 18))
                            .foregroundColor(Color("Title"))
                        Spacer()
                    }
                    .padding(.top,16)
                    .padding(.leading,8)
                    
                    HStack{
                        Text("Tanggal")
                            .font(.custom("PlusJakartaSans-Medium", size: 16))
                            .foregroundColor(Color("Gray"))
                            .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text("Buka")
                            .font(.custom("PlusJakartaSans-Medium", size: 16))
                            .foregroundColor(Color("Gray"))
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Text("Tutup")
                            .font(.custom("PlusJakartaSans-Medium", size: 16))
                            .foregroundColor(Color("Gray"))
                            .frame(width: 100, alignment: .leading)
                    }
                    .padding()
                    .frame(height: 54)
                    
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .cornerRadius(10)
                    
            VStack{
                RiwayatKasirList()
                RiwayatKasirList()
                RiwayatKasirList()
            }
                    
                    Spacer()
                    
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
            
            
        }
    
}

#Preview {
    RiwayatKasirCart()
}
