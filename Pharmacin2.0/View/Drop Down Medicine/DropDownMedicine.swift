//
//  DropDownMedicine.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 12/07/24.
//

import SwiftUI

struct DropDownMedicine: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool
    var body: some View {
        TextField("Masukkan Obat", text: $searchText, onEditingChanged: { editing in
                   isEditing = editing
               })
            .padding(.leading)
            .frame(height: 38)
            .foregroundColor(Color("RegularText"))
            .font(.custom("PlusJakartaSans-Medium", size: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
            )
            
    }
}
//
//#Preview {
////    DropDownMedicine(searchText: .constant(""))
//}
