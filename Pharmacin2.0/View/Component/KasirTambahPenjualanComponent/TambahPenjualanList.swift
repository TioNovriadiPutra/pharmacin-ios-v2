//
//  TambahPenjualanList.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TambahPenjualanList: View {
    
    @Binding var listObat: [Obat]?
    @Binding var isShowPopUp: Bool
    @Binding var editObatIndex: Int?
    @Binding var isEditing: Bool
    @Binding var listQty: [Int]?
    
    
    func deleteItem(at index: Int) {
        listObat?.remove(at: index)
        listQty?.remove(at: index)
    }
    
    var body: some View {
        
        ZStack{
        ScrollView{
            VStack(alignment: .center, spacing: 20) {
                HStack {
                    Text("Item")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 350, alignment: .leading)
                    Spacer()
                    Text("QTY")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 100, alignment: .leading)
                    Spacer()
                    Text("Harga")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 180, alignment: .leading)
                    Spacer()
                    
                    Text("Total")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 180, alignment: .leading)
                    Spacer()
                    Text("Tindakan")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 80, alignment: .leading)
                }
                .padding(.horizontal)
                .frame(height: 54)
                .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                .cornerRadius(10)
                
                 
                
                if let listObat = listObat, let listQty = listQty{
                    
                    
                    ForEach(listObat.indices, id: \.self) { index in
                        TambahPenjualanTable(obat: listObat[index], qty: listQty[index], onDelete: {
                            deleteItem(at: index)
                            print(listObat)
                        }, onEdit: {
                            editObatIndex = index
                            isEditing = true
                            isShowPopUp = true
                            
                            print(listObat)
                        })
                    }
                }
                                                         
                
                
                Button {
                    isEditing = false
                    isShowPopUp = true
                } label: {
                    ActionButton(title: "Tambah Item", width: 155, height: 44, radius: 10, bgColor: "DarkBlue")
                    
                  
                }
                
                Spacer()
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(12)
        }
        
    }
        
        
    }
}

//struct TambahPenjualanList_Preview: PreviewProvider {
//    static var previews: some View {
////        TambahPenjualanList(listObat: <#Binding<[Obat]>#>, isShowPopUp: <#Binding<Bool>#>, editObatIndex: <#Binding<Int?>#>, isEditing: <#Binding<Bool>#>).previewInterfaceOrientation(.landscapeRight)
//    }
//}


