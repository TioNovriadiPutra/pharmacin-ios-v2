//
//  ApotekPengambilanObat.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ApotekPengambilanObatView: View {
    @State private var searchText: String = ""
    @State var isShowingPopUpView : Bool = false
    @State private var isShowingDetailApotek = false
 
    @State var showPopUpDeleteQueueApotek : Bool = false
    
    @StateObject var viewModel = ApotekVM()
    @State private var pasien: Pasien?
    @State private var id = 0
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    Color(red: 0.98, green: 0.98, blue: 0.99)
                        .ignoresSafeArea()
                    
                    VStack(alignment:.leading, spacing: 14){
                        
                        HStack{
                            Text("Apotek")
                                .font(.custom("PlusJakartaSans-Bold", size: 24))
                                .foregroundColor(Color("Title"))
                            
                            Text("/ Pengambilan Obat")
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
                            DashboardCard("Total Antrian", value: "190", image: "PeopleBlueIcon", sizeValue: 20)
                            DashboardCard("Antrian Sekarang", value: "Rp.1.000.000", image: "PeopleGreenIcon", sizeValue: 14)
                            DashboardCard("Antrian Selanjutnya", value: "33", image: "PeopleYellowIcon", sizeValue: 20)
                            DashboardCard("Sisa Antrian", value: "421", image: "PeopleRedIcon", sizeValue: 20)
                        }
                        
                        ScrollView(.vertical){
                            VStack(spacing:14){
                                ForEach(viewModel.pasienList.indices, id: \.self) { index in
                                    let pasien = viewModel.pasienList[index]
                                    ApotekList(showDeletePopUp: $isShowingPopUpView, showDetailApotek: $isShowingDetailApotek, pasien: pasien, nomorAntrian: index+1) {
                                        self.pasien = pasien
                                        self.id = pasien.id
                                    }
                                }
                                
                                Spacer()
                            }
                        }.refreshable {
                            getAntrianApotek()
                        }
                        
                    }
                    
                    .padding()
                    .navigationDestination(isPresented: $isShowingDetailApotek) {
                        DetailApotekView(pasienID: id)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
        .onAppear{
            getAntrianApotek()
        }
        .sheet(isPresented: $showPopUpDeleteQueueApotek, onDismiss: {
            //                    showConfirmPayment = false
        }) {
            if let pasien = pasien {
                PopUpDelete(showPopUpDelete: $showPopUpDeleteQueueApotek, deleteAction: {
                    deletePasien()
                })
                .presentationBackground(.clear)
                .interactiveDismissDisabled()
            }
            
        }
        
    }
    
    private func getAntrianApotek() {
        viewModel.getAntrianApotek() { message, success in
            if success {
                print(message ?? "Unknown error")
            } else {
                print("GAGAL AMBIL PASIEN")
            }
        }
    }
    
    private func deletePasien(){
        viewModel.deleteAntrianPasien(id: id) { message, success in
            if success {
                #warning("REFRESH VIEW")
            } else {
                print("GAGAL AMBIL PASIEN")
            }
        }
    }
}

//struct ApotikPengambilanObat_Previews: PreviewProvider {
//    static var previews: some View {
//
//        ApotekPengambilanObatView().previewInterfaceOrientation(.landscapeRight)
//
//    }
//}
