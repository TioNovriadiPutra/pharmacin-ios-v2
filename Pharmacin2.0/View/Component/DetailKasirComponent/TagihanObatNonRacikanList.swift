//
//  TagihanObatNonRacikan.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TagihanObatNonRacikanList: View {
    
    var dataPasien : DataPasien
    @State private var showPopUpDelete: Bool = false
    
    @StateObject var viewModel = DetailKasirVM()
    @State private var isLoading = false
    @State private var id : Int?
    var deleteAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tagihan Obat")
                .font(.custom("PlusJakartaSans-Semibold", size: 18))
                .foregroundColor(Color("Title"))
                .padding()
            VStack{
                HStack {
                    Text("Item")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 200, alignment: .leading)
                    Spacer()
                    Text("QTY")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 80, alignment: .leading)
                    Spacer()
                    Text("Takaran")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 120, alignment: .leading)
                    Spacer()
                    Text("Aturan Pakai")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 200, alignment: .leading)
                    Spacer()
                    Text("Subtotal")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 150, alignment: .leading)
                    Spacer()
                    Text("Tindakan")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 100, alignment: .center)
                    
                    
                }
            }
            .padding()
            .frame(height: 54)
            
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            
            .cornerRadius(10)
            
            
            
            VStack {
                
                ForEach(dataPasien.drug_carts.indices, id: \.self) { index in
                    let obat = dataPasien.drug_carts[index]
                    TagihanObatNonRacikanListTable(drug: obat, showPopUpDelete: $showPopUpDelete, deleteAction: {
                        id = obat.id
                    })
                        
                }
                
                
            }
            
            .background(.white)
            .cornerRadius(10)
            
            HStack {
                Spacer()
                Text("Total")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(Color("Gray"))
                    .frame(width: 180, alignment: .center)
                Spacer()
                Text("Rp.\(dataPasien.drug_carts_total_price)")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 150, alignment: .leading)
                
                
            }
            
            .padding()
            .frame(height: 54)
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            .cornerRadius(10)
        }
//        .loadingView(isLoading: $isLoading)
        .padding()
        .background(.white)
        .cornerRadius(10)
        .sheet(isPresented: $showPopUpDelete, onDismiss: {
        }) {
            PopUpDelete(showPopUpDelete: $showPopUpDelete, deleteAction: {
                deleteDrugItem()
            })
            .presentationBackground(.clear)
            .interactiveDismissDisabled()
            
            
        }
    }
    
    private func deleteDrugItem() {
        isLoading = true
        guard let id = id else{
            return
        }
        viewModel.deleteDrugItem(id: id) {
            message, success in
            isLoading = false
            print("Delete obat \(id)")
            if success{
                deleteAction()
            }else{
                print("GAGAL MENGHAPUS OBAT")
            }
        }
    }
}

//struct TagihanObatNonRacikanList_Previews: PreviewProvider {
//    static var previews: some View {
//
//        TagihanObatNonRacikanList().previewInterfaceOrientation(.landscapeRight)
//
//    }
//}

