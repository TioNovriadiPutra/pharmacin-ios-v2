//
//  RawatPasienView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct RawatPasienView: View {
    @Binding var showPopUpDelete: Bool
    @Binding var showPanggilPasienPopUp: Bool
    
    
    @StateObject var viewModel = RawatPasienVM()
    
    @State private var nomorAntrian = Int()
    @Binding var selectedPasien: Pasien?
    
    var body: some View {
        ZStack {
            Color(red: 0.98, green: 0.98, blue: 0.99)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    Text("Rawat Pasien")
                        .font(.custom("PlusJakartaSans-Bold", size: 24))
                        .foregroundColor(Color("Title"))
                    
                    Text("/ Antrian Pasien")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(Color("Gray"))
                    
                    Spacer()
                }
                
                HStack(spacing: 14) {
                    DashboardCard("Total Antrian", value: "190", image: "PeopleBlueIcon", sizeValue: 20)
                    DashboardCard("Antrian Sekarang", value: "Rp.1.000.000", image: "PeopleGreenIcon", sizeValue: 14)
                    DashboardCard("Antrian Selanjutnya", value: "33", image: "PeopleYellowIcon", sizeValue: 20)
                    DashboardCard("Sisa Antrian", value: "421", image: "PeopleRedIcon", sizeValue: 20)
                }
                
                // Display RawatPasienList for each patient
                ForEach(viewModel.pasienList.indices, id: \.self) { index in
                    let pasien = viewModel.pasienList[index]
                    RawatPasienList(showingDeletePopUp: $showPopUpDelete, showingPanggilPasienPopUp: $showPanggilPasienPopUp, pasienToCall: $selectedPasien, nomorAntrian: index+1, pasien: pasien)
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            // Call getListPasien when RawatPasienView appears
            getListPasien()
        }
    }
    
    private func getListPasien() {
        print(GlobalVariable.authToken)
        viewModel.getAntrianPasien() { message, success in
            if success {
                print(message ?? "Unknown error")
            } else {
                print("GAGAL AMBIL PASIEN")
            }
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
