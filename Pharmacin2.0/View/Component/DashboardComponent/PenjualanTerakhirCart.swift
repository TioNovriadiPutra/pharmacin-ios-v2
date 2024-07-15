//
//  PenjualanTerakhirCart.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct PenjualanTerakhirCart: View {
    
    private var dataSelling: [Selling]
    init(data: [Selling]) {
        self.dataSelling = data
    }
    var body: some View {
        
        VStack(spacing:24){
            
                HStack{
                    Text("Penjualan Terakhir")
                        .font(.custom("PlusJakartaSans-semiBold", size: 18))
                        .foregroundColor(Color("Title"))
                    Spacer()
                }
                .padding(.top,16)
                .padding(.leading,8)
                
                HStack{
                    Text("No Invoice")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 160, alignment: .leading)
                    Spacer()
                    Text("Total")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 200, alignment: .leading)
                }
                .padding()
                .frame(height: 54)
                .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                .cornerRadius(10)
                
            
            ScrollView(.vertical){
                VStack(spacing:14){
                    ForEach(dataSelling.indices, id: \.self) { index in
//                        let pasien = viewModel.pasienList[index]
                        InvoiceList(data: dataSelling[index])
                    }
                    
                    
                    Spacer()
                }
            }
//            VStack{
//                InvoiceList()
//                InvoiceList()
//                InvoiceList()
//            }
     
    
                Spacer()
                
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(10)
        }
    
}

//#Preview {
//    PenjualanTerakhirCart()
//}

