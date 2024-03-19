//
//  DetailKasirView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DetailKasirView: View {
    @State private var searchText: String = ""
    let searchPaymentList = ["Red", "Green", "Blue", "Black", "Tartan"]
    @State private var searchName: String = ""
    @State private var selectionPayment = ""
    @State private var searchPayment: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var pasien: Pasien
    
    
    
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
                            RincianPembayaranHeader(pasien: pasien)
                            
                            HStack(spacing:14){
                                VStack(alignment: .leading, spacing: 10){
                                    Text("Sub Total")
                                        .font(.custom("PlusJakartaSans-medium", size: 16))
                                        .foregroundColor(Color("Gray"))
                                    
                                    Text("220.000.000")
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
                                    
                                    Text("220.000.000")
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
                                    
                                    Text("220.000.000")
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
                                    
                                    TextField("Masukan Tunai", text: $searchName)
                                    
                                        .autocapitalization(.none)
                                        .font(.custom("PlusJakartaSans-Medium", size: 14))
                                        .padding(.horizontal)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                                                .frame(height: 38)
                                        )
                                    
                                        .padding(.bottom,15)
                                    
                                    Text("Kembalian")
                                        .font(.custom("PlusJakartaSans-medium", size: 16))
                                        .foregroundColor(Color("Gray"))
                                    
                                    
                                    Text("220.000.000")
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
                            
                            TagihanObatNonRacikanList()
                            TagihanObatRacikanList()
                            TagihanTindakanPasienList()
                        }
                    }
                    
                 
                }
                .padding()
            }
        }
    }
}
}

//struct DetailKasirView_Previews: PreviewProvider {
//    static var previews: some View {
//        
////        DetailKasirView().previewInterfaceOrientation(.landscapeRight)
//        
//    }
//}

