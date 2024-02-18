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
    
    @Binding var listObat: [Obat]
    @Binding var isShowPopUp: Bool
    @Binding var editObatIndex: Int?
    @Binding var isEditing: Bool
    
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
                        
                        
                        KasirList(showPopUpDeleteKasir: $showPopUpDeleteKasir, showDetailKasir: $isShowingDetailKasir)
                        KasirList(showPopUpDeleteKasir: $showPopUpDeleteKasir, showDetailKasir: $isShowingDetailKasir)
                        KasirList(showPopUpDeleteKasir: $showPopUpDeleteKasir, showDetailKasir: $isShowingDetailKasir)
                        KasirList(showPopUpDeleteKasir: $showPopUpDeleteKasir, showDetailKasir: $isShowingDetailKasir)
                        KasirList(showPopUpDeleteKasir: $showPopUpDeleteKasir, showDetailKasir: $isShowingDetailKasir)
                        
                        
                        Spacer()
                        
                    }
                    
                    .padding()
                    
                    .navigationDestination(isPresented: $isShowingTambahPenjualanView) {
                        KasirTambahPenjualanView(listObat: $listObat, isShowPopUp: $isShowPopUp, editObatIndex: $editObatIndex, isEditing: $isEditing).navigationBarBackButtonHidden()
                    }
                    
                    .navigationDestination(isPresented: $isShowingDetailKasir) {
                        DetailKasirView().navigationBarBackButtonHidden()
                    }
                        
                }
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
