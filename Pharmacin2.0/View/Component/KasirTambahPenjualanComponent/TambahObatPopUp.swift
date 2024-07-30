//
//  TambahObatPopUp.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 16/02/24.
//

import SwiftUI

struct TambahObatPopUp: View {
    
    @State private var searchName: String = ""
    @State private var searchText = ""
    @State private var isEditingTextField = false
    
    @State private var QTY: Int = 1
    
    @State private var obatName: String?
    @State private var takaran: String?
    @State private var harga: String?
    @State private var isSearching = false
    
    let dataObat: [Obat] = obats
    
    @Binding var listObat: [Obat]?
    var obatToEdit: Obat?
    
    @State private var obatToAdd: Obat?
    @Binding var isEditing: Bool
    
    @Binding var showPopUp: Bool
    
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    
                    Button(action: {
                        showPopUp = false
                    }, label: {
                        Image("BackIcon")
                            .padding(.leading,16)
                    })
                    
                    
                    Text("Tambah Obat")
                        .font(.custom("PlusJakartaSans-Bold", size: 24))
                        .foregroundColor(Color("RegularText"))
                        .padding(.leading,60)
                    
                    Spacer()
                }
                
                
                VStack(spacing:18){
                    if let obat = obatToEdit, isEditing {
                        TextField("Masukan Nama", text: $searchName)
                            .padding(.leading)
                            .frame(width: 378, height: 38)
                            .autocapitalization(.none)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                            )
                            .font(.custom("PlusJakartaSans-Regular", size: 14))
                            .foregroundColor(Color("RegularText"))
                            .padding(.bottom,4)
                            .onAppear {
                                obatName = obat.nama
                                takaran = obat.takaran
                                harga = "\(obat.harga)"
                                QTY = obat.qty
                            }
                    } else {
                        
                        VStack {
                            DropDownMedicine(searchText: $searchText, isEditing: $isEditingTextField)
                                .onTapGesture {
                                    isEditingTextField = true
                                }
                            
                            if isEditingTextField {
                                ScrollView {
                                    VStack(alignment: .leading, spacing: 0) {
                                        ForEach(dataObat.filter { $0.nama.lowercased().contains(searchText.lowercased()) }) { item in
                                            VStack(spacing: 0) {
                                                Button(action: {
                                                    searchText = item.nama
                                                    obatName = item.nama
                                                    takaran = item.takaran
                                                    harga = "\(item.harga)"
                                                    obatToAdd = item
                                                    isEditingTextField = false
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
                                .frame(maxHeight: 200)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    Text("\(obatName ?? "Nama Obat")")
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .foregroundColor(Color("RegularText"))
                        .padding()
                        .frame(width: 378, alignment: .leading)
                        .frame(width: 378, height: 38)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(4)
                    
                    
                    Text("\(takaran ?? "Takaran")")
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .foregroundColor(Color("RegularText"))
                        .padding()
                        .frame(width: 378, alignment: .leading)
                        .frame(width: 378, height: 38)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(4)
                    
                    
                    Text("\(harga ?? "Harga")")
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .foregroundColor(Color("RegularText"))
                        .padding()
                        .frame(width: 378, alignment: .leading)
                        .frame(width: 378, height: 38)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(4)
                    
                }
                
                
                .padding(.bottom,42)
                
                HStack(spacing:14){
                    
                    Button{
                        if QTY > 1 {
                            QTY -= 1 // Kurangi nilai QTY jika lebih besar dari 0
                        }
                    }label: {
                        Image("Minus")
                        
                    }
                    
                    TextField("QTY", text: Binding(
                        get: { "\(QTY)" }, // Convert Int to String
                        set: {
                            if let value = Int($0) { // Convert String to Int
                                QTY = value
                            }
                        }
                    ))
                    .frame(width: 146, height: 38)
                    .autocapitalization(.none)
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                    )
                    .font(.custom("PlusJakartaSans-Regular", size: 17))
                    .foregroundColor(Color("RegularText"))
                    
                    .multilineTextAlignment(.center)
                    
                    
                    
                    Button{
                        QTY += 1
                    }label: {
                        Image("Plus")
                        
                    }
                    
                }
                .padding(.bottom,38)
                
                Button{
                    if let obat = obatToEdit, isEditing {
                        // Update existing obat data
                        let updatedObat = Obat(id: obat.id, nama: obatName ?? "", takaran: takaran ?? "", harga: Double(harga ?? "0") ?? 0, qty: Int(QTY) )
                        if let editIndex = listObat?.firstIndex(where: { $0.nama == obat.nama }) { // Cari index obat yang sesuai dengan id yang sama
                            listObat?[editIndex] = updatedObat // Update obat di index tersebut
                        }
                    } else if let newObat = obatToAdd {
                        // Tambahkan obat baru
                        listObat?.append(newObat)
                    }
                    
                    showPopUp = false
                }label: {
                    ActionButton(title: isEditing ? "Simpan Obat" : "Tambah Obat" , width: 245, height: 44, radius: 10, bgColor: "Green")
                }
                
                
            }
            .padding(.vertical)
            
        }
        .padding()
        .frame(width: 414, height: 520)
        .background(.white)
        .cornerRadius(10)
        
        
        var searchResults: [Obat] {
            if searchName.isEmpty {
                return dataObat
            } else {
                return dataObat.filter { $0.nama.lowercased().contains(searchName.lowercased()) }
            }
        }
    }
}

//#Preview {
//    TambahObatPopUp(listObat: .constant([]), tambahObatBaru: { _ in }, isEditing: .constant(true), showPopUp: .constant(false))
//}
