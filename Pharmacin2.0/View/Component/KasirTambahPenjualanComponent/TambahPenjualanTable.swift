//
//  TambahPenjualanTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TambahPenjualanTable: View {
    @State private var searchObat: String = ""
    @State private var masukkanJumlah: String = ""
    var onDelete: (() -> Void)?
    
    
    var body: some View {
        VStack{
//        HStack {
//            TextField("Masukan Obat", text: $searchObat)
//                .padding()
//                .autocapitalization(.none)
//                .font(.custom("PlusJakartaSans-Medium", size: 14))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
//                )
//                .frame(width: 260, height: 38)
//                .font(.custom("PlusJakartaSans-Regular", size: 14))
//                .foregroundColor(Color("RegularText"))
//                .frame(width: 253, alignment: .leading)
//                .padding(.leading,12)
//            
//            Spacer()
//            
//            Text("100")
//                .font(.custom("PlusJakartaSans-Regular", size: 14))
//                .foregroundColor(Color("RegularText"))
//                .frame(width: 100, alignment: .center)
//            
//            
//            
//            
//            TextField("      -", text: $masukkanJumlah)
//                .padding()
//                .autocapitalization(.none)
//                .font(.custom("PlusJakartaSans-Medium", size: 14))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
//                )
//                .frame(width: 68, height: 38)
//                .font(.custom("PlusJakartaSans-Regular", size: 14))
//                .foregroundColor(Color("RegularText"))
//                .frame(width: 100, alignment: .leading)
//                .padding(.leading,-12)
//            
//            Spacer()
//            
//            Text("100.000.000")
//                .font(.custom("PlusJakartaSans-Regular", size: 14))
//                .foregroundColor(Color("RegularText"))
//                .frame(width: 180, alignment: .leading)
//                .padding(.leading,10)
//            Spacer()
//            
//            
//            Text("100.000.000.000")
//                .font(.custom("PlusJakartaSans-Regular", size: 14))
//                .foregroundColor(Color("RegularText"))
//                .frame(width: 194, alignment: .leading)
//            
//            Spacer()
//             
//            Button{
//                onDelete?()
//            }label: {
//                Text("X")
//                    .font(.custom("PlusJakartaSans-SemiBold", size: 16))
//                    .foregroundColor(.white)
//                    .frame(width: 32, alignment: .center)
//                    .frame(height: 32)
//                    .background(Color("Red"))
//                    .cornerRadius(10)
//                
//            }.frame(width: 80, alignment: .leading)
//               
//        }
            HStack {
                TextField("Masukan Obat", text: $searchObat)
                    .padding()
                    .autocapitalization(.none)
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                    )
                    .frame(width: 270, height: 38)
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 265, alignment: .leading)
                    
                
                Spacer()
                
                Text("100")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 100, alignment: .center)
                
                
                Spacer()
                
                TextField("      -", text: $masukkanJumlah)
                    .padding()
                    .autocapitalization(.none)
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                    )
                    .frame(width: 68, height: 38)
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 100, alignment: .leading)
                                    
                Spacer()
                
                Text("100.000.000")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 180, alignment: .leading)
                    .padding(.leading,10)
                Spacer()
                
                
                Text("100.000.000.000")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 194, alignment: .leading)
                
                Spacer()
                 
                Button{
                    onDelete?()
                }label: {
                    Text("X")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 32, alignment: .center)
                        .frame(height: 32)
                        .background(Color("Red"))
                        .cornerRadius(10)
                    
                }.frame(width: 80, alignment: .leading)
                   
            }
       
        
    }
        
    }
}

struct TambahPenjualanTable_Preview: PreviewProvider {
    static var previews: some View {
        TambahPenjualanList()
        TambahPenjualanList().previewInterfaceOrientation(.landscapeRight)
        TambahPenjualanTable().previewInterfaceOrientation(.landscapeRight)
        
    }
}

