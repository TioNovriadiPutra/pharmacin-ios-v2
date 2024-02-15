//
//  RawatPasienView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct RawatPasienView: View {
    @Binding var showPopUpDelete : Bool
    
    var body: some View {
        ZStack{
            Color(red: 0.98, green: 0.98, blue: 0.99)
                .ignoresSafeArea()
            
            VStack(alignment:.leading, spacing: 14){
                
                HStack{
                    Text("Rawat Pasien")
                        .font(.custom("PlusJakartaSans-Bold", size: 24))
                        .foregroundColor(Color("Title"))
                    
                    Text("/ Antrian Pasien")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(Color("Gray"))
                    
                    
                    Spacer() 
                    
                }
                HStack(spacing: 14){
                    DashboardCard("Total Transaksi Jual", value: "190", image: "PeopleBlueIcon", sizeValue: 20)
                    DashboardCard("Total Penjualan", value: "Rp.1.000.000", image: "PeopleGreenIcon", sizeValue: 14)
                    DashboardCard("Kadaluarsa", value: "33", image: "PeopleYellowIcon", sizeValue: 20)
                    DashboardCard("Stok Menipis", value: "421", image: "PeopleRedIcon", sizeValue: 20)
                    
                }
                
                
                RawatPasienList(showingDeletePopUp: $showPopUpDelete)
                RawatPasienList(showingDeletePopUp: $showPopUpDelete)
                RawatPasienList(showingDeletePopUp: $showPopUpDelete)
                RawatPasienList(showingDeletePopUp: $showPopUpDelete)
                RawatPasienList(showingDeletePopUp: $showPopUpDelete)
                

                Spacer()
                
            }
            
            .padding()
            
            
        }
    }
}

//struct RawatPasien_Previews: PreviewProvider {
//    static var previews: some View {
//        
////        RawatPasienView().previewInterfaceOrientation(.landscapeRight)
//        
//    }
//}
