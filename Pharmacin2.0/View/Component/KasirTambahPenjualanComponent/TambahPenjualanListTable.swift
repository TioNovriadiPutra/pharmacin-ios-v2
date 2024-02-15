//
//  TambahPenjualanListTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TambahPenjualanListTable: View {
    @State private var numberOfTables = 1
    @State private var tableData = [Int](repeating: 0, count: 1)
    var body: some View {

        VStack{
            
            ForEach(tableData.indices, id: \.self) { index in
                
                
                    TambahPenjualanTable {
                        removeRow(at: index)
                        print(index)
                        print(tableData)
                    }
                    Divider()
                        .padding()
                    
                }
                .padding(.top,20)
                
             
            Button(action: {
                // Tambah satu TambahPenjualanTable()
                //numberOfTables += 1
                tableData.append(tableData.count)
//                print(tableData)
            }){
                ActionButton(title: "Tambah Item", width: 155, height: 44, radius: 10, bgColor: "DarkBlue")
            }
            
           
             
        }
        
    }
    func removeRow(at index: Int) {
//        guard tableData.indices.contains(index) else {
//            return // Menangani kasus jika indeks tidak valid
//        }
        if let index = tableData.firstIndex(of: index) {
                tableData.remove(at: index)
            }
    }
    
    
}

struct TambahPenjualanListTable_Preview: PreviewProvider {
    static var previews: some View {
        TambahPenjualanListTable()
        TambahPenjualanListTable().previewInterfaceOrientation(.landscapeRight)
        
    }
}
