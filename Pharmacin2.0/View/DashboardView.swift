//
//  DashboardView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var isClose = false
    @State private var isLoading = false
    @StateObject var viewModel = DashboardVM()
    @State private var data : DashboardModel?
    
    
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
                    DashboardCard("Total Transaksi Jual", value: "\(data?.data.report[0].total_transaction ?? 0)", image: "MoneyBlueIcon", sizeValue: 20)
                    DashboardCard("Total Penjualan", value: "\(data?.data.report[0].total_transaction_price ?? 0)", image: "MoneyGreenIcon", sizeValue: 20)
                    DashboardCard("Jumlah Pasien", value: "\(data?.data.report[0].total_patient ?? 0)", image: "PeopleYellowIcon", sizeValue: 20)
                    DashboardCard("Sisa Pasien", value: "\(data?.data.report[0].rest_patient ?? 0)", image: "PeopleRedIcon", sizeValue: 20)
                    
                }
                
                HStack(spacing:16){
                    PenjualanTerakhirCart(data: data?.data.selling ?? [])
                    RiwayatKasirCart(data: data?.data.cashier ?? [])
                }
                
            }
            
            .padding()
            
            
            
        }
        .onAppear{
            getDataDashbord()
        }
        .loadingView(isLoading: $isLoading)
    }
    
    private func getDataDashbord() {
        isLoading = true
        viewModel.getDataDashboard {
            message, success, data in
            isLoading = false
            if success {
                guard let data = data else{
                    return
                }
                self.data = data
            } else {
                print("Gagal Ambil data Dashboard")
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        
        DashboardView().previewInterfaceOrientation(.landscapeRight)
        
    }
}
