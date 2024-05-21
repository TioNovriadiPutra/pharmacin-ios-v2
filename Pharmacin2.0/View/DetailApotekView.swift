//
//  DetailApotekView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DetailApotekView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = DetailApotekVM()
    @State private var pasien : DataPasienApotek?
    @State private var isLoading = false
    
    @State private var showConfirmPayment = false
    
    var pasienID : Int?
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    Color(red: 0.98, green: 0.98, blue: 0.99)
                        .ignoresSafeArea()
                    
                    VStack(spacing:14){
                        
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image("BackIcon")
                            })
                            
                            
                            Spacer()
                            
                            HStack{
                                Text("Detail Obat Pasien")
                                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                                    .foregroundColor(Color("RegularText"))
                                
                                Text("(Belum Diproses)")
                                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                                    .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image("CheckIcon")
                            })
                            
                            
                        }
                        .padding()
                        .background()
                        .frame(height: 44)
                        
                        .cornerRadius(10)
                        
                        ScrollView{
                            VStack(spacing:14){
                                if let pasien = pasien {
                                    DetailApotekHeader(pasien: pasien)
                                    ObatNonRacikanApotek(dataPasien: pasien)
//                                    ObatRacikanApotek()
                                }
                            }
                        }
                        
                        
                    }
                    
                    .padding()
                    
                }
                .onAppear{
                    getDetailApotek()
                }
                .loadingView(isLoading: $isLoading)
                .sheet(isPresented: $showConfirmPayment, onDismiss: {
                    //                    showConfirmPayment = false
                }) {
                    if let pasien = pasien {
                        PopUpPenyerahanObat(pasien: pasien, konfirmasiPenyerahan: {
                            konfirmasiPenyerahanObat()
                        }, showPopUpPenyerahanObat: $showConfirmPayment)
                        .presentationBackground(.clear)
                        .interactiveDismissDisabled()
                    }
                    
                }
            }
        }
    }
    
    private func konfirmasiPenyerahanObat() {
        isLoading = true
        guard let pasienID = pasienID else{
            return
        }
        viewModel.konfirmasiPenyerahanObat(id: pasienID) {
            message, success in
            isLoading = false
            if success{
                presentationMode.wrappedValue.dismiss()
            }else{
                print("GAGAL KONFIRMASI PEMBAYARAN")
            }
        }
    }
    
    private func getDetailApotek() {
        isLoading = true
        viewModel.getDetailApotek(id: pasienID ?? 0) {
            message, success in
            isLoading = false
            if success {
                pasien = viewModel.pasien
            } else {
                print("GAGAL AMBIL PASIEN")
            }
        }
    }
}

struct DetailApotekView_Previews: PreviewProvider {
    static var previews: some View {
        
        DetailApotekView().previewInterfaceOrientation(.landscapeRight)
        
    }
}
