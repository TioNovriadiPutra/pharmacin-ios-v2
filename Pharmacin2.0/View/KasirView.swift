//
//  KasirView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct KasirView: View {
    @State private var searchText: String = ""
    @State private var isShowingTambahPenjualanView = false
    @State private var isShowingDetailKasir = false
    
    @Binding var showPopUpDeleteKasir : Bool
    
    //    @State private var selectedPatient: Pasien = Pasien(id: 1, registration_number: "", full_name: "", record_number: "", status: "")
    
    @Binding var listObat: [Obat]
    @Binding var isShowPopUp: Bool
    @Binding var editObatIndex: Int?
    @Binding var isEditing: Bool
    @Binding var isShowKonfirmasiPembayaran: Bool
    
    @StateObject var viewModel = KasirMenungguPembayaranVM()
    
    @State private var pasien: Pasien?
    
    
    
    //    private var pasienKlik: Pasien
    
    var body: some View {
        NavigationStack{
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
                            
                            HStack(spacing:14){
                                Button {
                                    isShowingTambahPenjualanView = true
                                } label: {
                                    ActionButton(title: "Tambah Penjualan Obat", width: 266, height: 44, radius: 10, bgColor: "DarkBlue")
                                }
                                
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
                            
                            
                            
                            
                        }
                        
                        ScrollView(.vertical){
                            VStack(spacing:14){
                                ForEach(viewModel.pasienList.indices, id: \.self) { index in
                                    var pasien = viewModel.pasienList[index]
                                    KasirList(showPopUpDeleteKasir: $showPopUpDeleteKasir, showDetailKasir: $isShowingDetailKasir, pasien: pasien, nomorAntrian: index+1){
                                        self.pasien = pasien
                                    }

//                                        .onTapGesture {
//                                            self.pasien = pasien
//                                        }
                                }
                                
                                Spacer()
                            }
                        }.refreshable {
                            getAntrianKasir()
                        }
                        
                        
                        Spacer()
                        
                    }
                    
                    .padding()
                    
                    
                    .navigationDestination(isPresented: $isShowingDetailKasir) {
                        if let pasien = pasien{
                            DetailKasirView(pasien: pasien).navigationBarBackButtonHidden()
                        }
                    }
                    
                    .navigationDestination(isPresented: $isShowingTambahPenjualanView) {
                        KasirTambahPenjualanView(listObat: $listObat, isShowPopUp: $isShowPopUp, editObatIndex: $editObatIndex, isEditing: $isEditing, isShowKonfirmasiPembayaran: $isShowKonfirmasiPembayaran).navigationBarBackButtonHidden()
                    }
                    
                    
                    
                }
                
                .onAppear{
                    // Call getListPasien when RawatPasienView appears
                    getAntrianKasir()
                }
                
                //                .onChange(of: refreshView) { old, new in
                //                    getAntrianKasir()
                //                }
            }
        }
    }
    
    private func getAntrianKasir() {
        print(GlobalVariable.authToken)
        viewModel.getAntrianKasir() { message, success in
            if success {
                print(message ?? "Unknown error")
            } else {
                print("GAGAL AMBIL PASIEN")
            }
        }
    }
}

//struct KasirView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        KasirView().previewInterfaceOrientation(.landscapeRight)
//
//    }
//}
