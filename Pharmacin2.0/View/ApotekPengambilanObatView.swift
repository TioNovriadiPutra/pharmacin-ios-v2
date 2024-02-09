//
//  ApotekPengambilanObat.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ApotekPengambilanObatView: View {
    @State private var searchText: String = ""
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color(red: 0.98, green: 0.98, blue: 0.99)
                    .ignoresSafeArea()
                
                VStack(alignment:.leading, spacing: 14){
                    
                    HStack{
                        Text("Kasir")
                            .font(.custom("PlusJakartaSans-Bold", size: 24))
                            .foregroundColor(Color("Title"))
                        
                        Text("/ Menunggu Pembayaran")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                            .foregroundColor(Color("Gray"))
                        
                        Spacer()
                        
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            
                            TextField("Search here...", text: $searchText)
                                .autocapitalization(.none)
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                            
                            
                        }
                        
                        .frame(width: 350, height: 44)
                        .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                        .cornerRadius(10)
                        
                        
                        
                        
                        
                    }
                    
                    HStack(spacing: 14){
                        DashboardCard("Total Transaksi Jual", value: "190", image: "TransactionIcon", sizeValue: 20)
                        DashboardCard("Total Penjualan", value: "Rp.1.000.000", image: "PenjualanIcon", sizeValue: 14)
                        DashboardCard("Kadaluarsa", value: "33", image: "KadaluarsaIcon", sizeValue: 20)
                        DashboardCard("Stok Menipis", value: "421", image: "StokMenipisIcon", sizeValue: 20)
                        
                    }
                    
                    
                    KasirList()
                    KasirList()
                    KasirList()
                    KasirList()
                    KasirList()
                    
                    Spacer()
                    
                }
                
                .padding()
                
                
            }
        }
    }
}

struct ApotikPengambilanObat_Previews: PreviewProvider {
    static var previews: some View {
        
        ApotekPengambilanObatView().previewInterfaceOrientation(.landscapeRight)
        
    }
}
