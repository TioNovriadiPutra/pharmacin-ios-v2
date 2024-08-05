//
//  DropDownView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 12/07/24.
//

import SwiftUI

struct DropDownView: View {
    var dataObat: [Obat] = obats
    @State private var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            DropDownMedicine(searchText: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing = true
                }
            
            if isEditing {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(dataObat.filter { $0.nama.lowercased().contains(searchText.lowercased()) }) { item in
                            VStack(spacing: 0) {
                                Button(action: {
                                    searchText = item.nama
                                    isEditing = false
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(item.nama)
                                                .padding()
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    }
                                    .frame(height: 50)
                                    .background(Color(uiColor: UIColor(red: 249/255, green: 249/255, blue: 252/255, alpha: 1)))
                                }
                                Divider()
                                    .background(Color.gray)
                            }
                        }
                    }
                }
//                .frame(maxHeight: 200)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    DropDownView()
}
