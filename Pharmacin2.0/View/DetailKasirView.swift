//
//  DetailKasirView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DetailKasirView: View {
    @State private var searchText: String = ""
    let searchPaymentList = ["Tunai"]
    @State private var inputCashValue: Int?
    @State private var selectionPayment = ""
    @State private var searchPayment: String = ""
    @State private var calculatedChange: Int = 0
    @State private var showConfirmPayment = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var pasien : DataPasien?
    @State private var isLoading = false
    
    var pasienID : Int?
    var updateData: () -> Void?
    
    @StateObject var viewModel = DetailKasirVM()
    
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
                                Text("Rincian Pembayaran")
                                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                                    .foregroundColor(Color("RegularText"))
                                
                                Text("(\(pasien?.status ?? ""))")
                                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                                    .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                showConfirmPayment = true
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
                                    RincianPembayaranHeader(pasien: pasien)
                                }
                                
                                
                                
                                HStack(spacing:14){
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Sub Total")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        Text("\(pasien?.sub_total_price ?? 0)")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .padding() // Menambahkan padding jika diperlukan
                                            .frame(width: 378, alignment: .leading) // Mengatur agar teks berada di leading
                                            .frame(height:38)
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                        
                                            .padding(.bottom,10)
                                        
                                        Text("Biaya Administrasi")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        Text("\(pasien?.outpatient_fee ?? 0)")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .padding() // Menambahkan padding jika diperlukan
                                            .frame(width: 378, alignment: .leading) // Mengatur agar teks berada di leading
                                            .frame(height:38)
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                        
                                            .padding(.bottom,10)
                                        
                                        Text("Total")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        Text("\(pasien?.total_price ?? 0)")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .padding() // Menambahkan padding jika diperlukan
                                            .frame(width: 378, alignment: .leading) // Mengatur agar teks berada di leading
                                            .frame(height:38)
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                        
                                            .padding(.bottom,10)
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 300)
                                    .frame(width: 414)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    
                                    
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Metode Pembayaran")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        
                                        
                                        HStack{
                                            //                                        if selectionPayment.isEmpty {
                                            //                                            Text("Pilih Jenis Pembayaran")
                                            //                                                .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            //                                                .foregroundColor(Color("Gray"))
                                            //                                        } else {
                                            //                                            Text(selectionPayment)
                                            //                                        }
                                            //                                        Spacer()
                                            Menu {
                                                ForEach(searchPaymentList, id: \.self) { option in
                                                    Button(action: {
                                                        selectionPayment = option
                                                    }) {
                                                        Text(option)
                                                    }
                                                }
                                            } label: {
                                                HStack {
                                                    Text(selectionPayment.isEmpty ? "Pilih Jenis Pembayaran" : selectionPayment)
                                                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                                                        .foregroundColor(selectionPayment.isEmpty ? Color("Gray") : .primary)
                                                    
                                                    Spacer()
                                                    Image("ArrowDownIcon")
                                                }
                                            }
                                            .menuStyle(BorderlessButtonMenuStyle())
                                            
                                            
                                        }
                                        .padding()
                                        .frame(height: 38)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                                        )
                                        
                                        .padding(.bottom,15)
                                        
                                        
                                        
                                        
                                        Text("Tunai")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                            .padding(.top,-2)
                                            .padding(.bottom,8)
                                        
                                        TextField("Masukkan Tunai", value: $inputCashValue, format: .number)
                                            .keyboardType(UIKeyboardType.decimalPad)
                                            .autocapitalization(.none)
                                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                                            .padding(.horizontal)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                                                    .frame(height: 38)
                                            )
                                            .onChange(of: inputCashValue) {old  in
                                                // Memastikan nilai baru tidak kosong dan karakter pertama adalah angka
                                                inputCashValue = Int("\(old)".filterNumericInput())
                                            }
                                            .onChange(of: inputCashValue) { old in
                                                calculateChange()
                                            }
                                        
                                            .padding(.bottom,15)
                                        
                                        Text("Kembalian")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        
                                        Text("\(max(calculatedChange,0))")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .frame(height:38)
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                        
                                        
                                        Spacer()
                                    }
                                    .padding(.top,20)
                                    .padding(.horizontal)
                                    .frame(height: 300)
                                    
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    
                                    
                                    
                                    
                                    
                                }
                                if let pasien = pasien {
                                    if pasien.drug_carts.count != 0{
                                        TagihanObatNonRacikanList(dataPasien: pasien, deleteAction: {
                                            getDetailKasir()
                                        })
                                    }
                                    
                                    if pasien.action_carts.count != 0{
                                        TagihanTindakanPasienList(dataPasien: pasien)
                                    }
                                }
                            }
                        }
                        
                        
                    }
                    .padding()
                }
                .onAppear{
                    getDetailKasir()
                }
                .loadingView(isLoading: $isLoading)
                .fullScreenCover(isPresented: $showConfirmPayment, onDismiss: {
                    //                    showConfirmPayment = false
                }) {
                    if let pasien = pasien {
                        KonfirmasiPembayaranPopUp(showKonfirmsasiPembayaranPopup: $showConfirmPayment, totalPembelian: "\(pasien.total_price)", tunai: "\(inputCashValue ?? 0)", kembalian: "\(calculatedChange)", confirmPayment: {
                            paymentConfirmed()
                        })
                        .presentationBackground(Color.black.opacity(0.4))
                        .interactiveDismissDisabled()
                    }
                    
                }
                
            }
        }
        
    }
    
    private func paymentConfirmed() {
        isLoading = true
        guard let pasienID = pasienID else{
            return
        }
        viewModel.konfirmasiPembayaran(id: pasienID) {
            message, success in
            isLoading = false
            if success{
                presentationMode.wrappedValue.dismiss()
                updateData()
            }else{
                print("GAGAL KONFIRMASI PEMBAYARAN")
            }
        }
    }
    
    private func getDetailKasir() {
        isLoading = true
        viewModel.getDetailKasir(id: pasienID ?? 0) {
            message, success in
            isLoading = false
            if success {
                pasien = viewModel.pasien
            } else {
                print("GAGAL AMBIL PASIEN")
            }
        }
    }
    
    private func calculateChange(){
        calculatedChange = (inputCashValue ?? 0) - (pasien?.total_price ?? 0)
    }
}



//struct DetailKasirView_Previews: PreviewProvider {
//    static var previews: some View {
//
////        DetailKasirView().previewInterfaceOrientation(.landscapeRight)
//
//    }
//}

