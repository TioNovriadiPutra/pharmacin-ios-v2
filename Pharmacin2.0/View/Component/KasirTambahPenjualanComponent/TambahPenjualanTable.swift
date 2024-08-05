//
//  TambahPenjualanTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TambahPenjualanTable: View {
    
    var obat: Obat
    
    var qty: Int
    
    var onDelete: (() -> Void)?
    var onEdit: (() -> Void)?
    
    var body: some View {
        VStack{
            HStack {
                Text(obat.nama)
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 350, alignment: .leading)
                
                
                Spacer()
                
                Text("\(qty)")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 100, alignment: .leading)
                
                
                Spacer()
                
                Text("\(Int(obat.harga))")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 180, alignment: .leading)
                
                Spacer()
                
                Text("\(Int(Double(qty) * obat.harga))")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 180, alignment: .leading)
                
                Spacer()
                
                HStack{
                Button{
                    onEdit?()
                }label: {
                    Image("EditYellow")
                    
                }
                
                Button{
                    onDelete?()
                }label: {
                    Image("CrossRed")
                }
                
            }.frame(width: 80, alignment: .leading)
                   
            }
       
        Divider()
    }
    .padding(.horizontal)
        
    }
}

//struct TambahPenjualanTable_Preview: PreviewProvider {
//    static var previews: some View {
//        TambahPenjualanList()
//        TambahPenjualanList().previewInterfaceOrientation(.landscapeRight)
////        TambahPenjualanTable(obat).previewInterfaceOrientation(.landscapeRight)
//        
//    }
//}

