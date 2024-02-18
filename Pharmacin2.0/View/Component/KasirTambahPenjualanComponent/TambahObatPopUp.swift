//
//  TambahObatPopUp.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 16/02/24.
//

import SwiftUI

struct TambahObatPopUp: View {
    
    @State private var searchName: String = ""
    
    @State private var QTY: Int = 1
    
    @State private var obatName: String = ""
    @State private var takaran: String = ""
    @State private var harga: String = ""
    
    
    @Binding var listObat: [Obat]
    var tambahObatBaru: (Obat) -> Void
    
    var obatToEdit: Obat?
    @Binding var isEditing: Bool
    
    @Binding var showPopUp: Bool
    
    
    var body: some View {
        VStack{
            HStack{
                
                Button(action: {
                    showPopUp = false
                }, label: {
                    Image("BackIcon")
                        .padding(.leading,40)
                })
                
                
                Text("Tambah Obat")
                    .font(.custom("PlusJakartaSans-Bold", size: 24))
                    .foregroundColor(Color("RegularText"))
                    .padding(.leading,40)
                
                Spacer()
            }
            .padding(.bottom,32)
            
            
            VStack(spacing:18){
                if let obat = obatToEdit, isEditing {
                    TextField("Masukan Nama", text: $obatName)
                        .padding(.leading)
                        .frame(width: 378, height: 38)
                        .autocapitalization(.none)
                        .font(.custom("PlusJakartaSans-Medium", size: 14))
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
                    TextField("Masukan Nama", text: $obatName)
                        .padding(.leading)
                        .frame(width: 378, height: 38)
                        .autocapitalization(.none)
                        .font(.custom("PlusJakartaSans-Medium", size: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.93, green: 0.93, blue: 0.96))
                        )
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .foregroundColor(Color("RegularText"))
                        .padding(.bottom, 4)
                }
                
                Text("Nama Obat")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .padding()
                    .frame(width: 378, alignment: .leading)
                    .frame(width: 378, height: 38)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .cornerRadius(4)
                
                
                Text("Takaran")
                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .padding()
                    .frame(width: 378, alignment: .leading)
                    .frame(width: 378, height: 38)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .cornerRadius(4)
                
                
                Text("Harga")
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
                    let updatedObat = Obat(nama: obatName, takaran: takaran, harga: Double(harga) ?? 0, qty: Int(QTY) )
                    if let editIndex = listObat.firstIndex(where: { $0.nama == obat.nama }) { // Cari index obat yang sesuai dengan id yang sama
                        listObat[editIndex] = updatedObat // Update obat di index tersebut
                    }
                } else {
                    // Tambahkan obat baru
                    let newObat = Obat(nama: obatName, takaran: takaran, harga: Double(harga) ?? 0, qty: Int(QTY) )
                    listObat.append(newObat)
                }
                
                showPopUp = false
            }label: {
                ActionButton(title: isEditing ? "Simpan Obat" : "Tambah Obat" , width: 245, height: 44, radius: 10, bgColor: "Green")
                
            }
            
            
        }
        .frame(width: 414, height: 520)
        .background(.white)
        .cornerRadius(10)
        
    }
}

#Preview {
    TambahObatPopUp(listObat: .constant([]), tambahObatBaru: { _ in }, isEditing: .constant(true), showPopUp: .constant(false))
}
