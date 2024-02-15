//
//  DashboardView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var isClose = false
    
    
    var body: some View {
        
        ZStack{
            Color(red: 0.98, green: 0.98, blue: 0.99)
                .ignoresSafeArea()
            
            VStack(alignment:.leading, spacing: 14){
                
                HStack{
                    Text("Dashboard")
                        .font(.custom("PlusJakartaSans-Bold", size: 24))
                        .foregroundColor(Color("Title"))
                    
                    
                    Spacer()
                    Button{
                        self.isClose.toggle()
                    }label: {
                        Text(isClose ? "Tutup Kasir" : "Buka Kasir")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 264, alignment: .center)
                            .frame(height: 40)
                            .background(isClose ? Color("Red") : Color("Green"))
                            .cornerRadius(10)
                            
                    }
                }
                HStack(spacing: 14){
                    DashboardCard("Total Transaksi Jual", value: "190", image: "MoneyBlueIcon", sizeValue: 20)
                    DashboardCard("Total Penjualan", value: "Rp.1.000.000", image: "MoneyGreenIcon", sizeValue: 14)
                    DashboardCard("Kadaluarsa", value: "33", image: "PeopleYellowIcon", sizeValue: 20)
                    DashboardCard("Stok Menipis", value: "421", image: "PeopleRedIcon", sizeValue: 20)
                    
                }
                
                
                
                
                    HStack(spacing:16){
                        PenjualanTerakhirCart()
                        RiwayatKasirCart()
                        
                    }
                
        
                 
                
                
                
                
            }
            
            .padding()
            
            
            
        }
        
        
        
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        
        DashboardView().previewInterfaceOrientation(.landscapeRight)
        
    }
}
