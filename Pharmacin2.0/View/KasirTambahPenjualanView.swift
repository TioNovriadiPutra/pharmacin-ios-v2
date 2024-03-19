//
//  KasirTambahPenjualanView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct KasirTambahPenjualanView: View {
    @State private var searchName: String = ""
    @State private var searchPayment: String = ""
    //    @Binding var showSuccessPopup: Bool
    
    let searchPaymentList = ["Red", "Green", "Blue", "Black", "Tartan"]
    @State private var selectionPayment = ""
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var listObat: [Obat]
    @Binding var isShowPopUp: Bool
    @Binding var editObatIndex: Int?
    @Binding var isEditing: Bool
    @Binding var isShowKonfirmasiPembayaran : Bool
    
    
    var body: some View {
//        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    Color(red: 0.98, green: 0.98, blue: 0.99)
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 14){
                        
                        HStack{
                            Text("Kasir")
                                .font(.custom("PlusJakartaSans-Bold", size: 24))
                                .foregroundColor(Color("Title"))
                            
                            Text("/ Tambah Penjualan Obat")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .foregroundColor(Color("Gray"))
                            
                            Spacer()
                            
                            
                            
                            
                            HStack (spacing:12){
                                Button{
                                    print("Cancel")
                                    presentationMode.wrappedValue.dismiss()
                                }label: {
                                    ActionButton(title: "Batalkan", width: 180, height: 44, radius: 10, bgColor: "Red")
                                }
                                
                                Button{
                                    isShowKonfirmasiPembayaran = true
                                }label: {
                                    ActionButton(title: "Konfirmasi", width: 180, height: 44, radius: 10, bgColor: "Green")
                                    
                                }
                            }
                            
                        }
                        
                        ScrollView(.vertical){
                            VStack{
                                HStack(spacing:12){
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Nama Pelanggan")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        TextField("Masukan Nama", text: $searchName)
                                            .padding()
                                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                                                    .frame(height: 38)
                                                
                                            )
                                            .frame(width: 378)
                                        
                                            .padding(.bottom,10)
                                        
                                        Text("Payment Type")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        HStack{
//                                            if selectionPayment.isEmpty {
//                                                Text("Pilih Jenis Pembayaran")
//                                                    .font(.custom("PlusJakartaSans-Regular", size: 14))
//                                                    .foregroundColor(Color("Gray"))
//                                            } else {
//                                                Text(selectionPayment)
//                                            }
//                                            Spacer()
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
                                        .frame(width: 378, height: 38)
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                                        )
                                        
                                        .padding(.bottom,10)
                                        
                                        
                                        Text("Date")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        Text("DD-MM-YYYY")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .padding()
                                            .frame(width: 378, alignment: .leading) // Mengatur agar teks berada di leading
                                            .padding() // Menambahkan padding jika diperlukan
                                            .frame(width: 378, height: 38)
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 300)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    
                                    
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Total")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        Text("222.000.000")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .frame(height: 38)
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                            .padding(.bottom,10)
                                        
                                        Text("Tunai")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                            .padding(.bottom,-8)
                                            .padding(.top,10)
                                        
                                        TextField("Masukan Tunai", text: $searchName)
                                            .padding()
                                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                                        
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                                                    .frame(height: 38)
                                                
                                                
                                            )
                                            .padding(.bottom,10)
                                        
                                        Text("Kembalian")
                                            .font(.custom("PlusJakartaSans-medium", size: 16))
                                            .foregroundColor(Color("Gray"))
                                        
                                        
                                        Text("222.000.000")
                                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                                            .foregroundColor(Color("RegularText"))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .frame(height: 38)
                                        
                                        
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(4)
                                        
                                        
                                        
                                        
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 300)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    
                                    
                                }
                                
                                TambahPenjualanList(listObat: $listObat, isShowPopUp: $isShowPopUp, editObatIndex: $editObatIndex, isEditing: $isEditing)
                                
                                
                                
                                Spacer()
                            }
                        }
                        
                    }
                    
                    
                    .padding()
                    
                    
                    
                }.ignoresSafeArea(.keyboard)
            }
//        }
    }
    
}

//struct Penjualan_Preview: PreviewProvider {
//    static var previews: some View {
//        KasirTambahPenjualanView().previewInterfaceOrientation(.landscapeRight)
//        
//    }
//}
