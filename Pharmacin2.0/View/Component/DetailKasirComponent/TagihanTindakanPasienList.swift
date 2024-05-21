//
//  TagihanTindakanPasienList.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TagihanTindakanPasienList: View {
    var dataPasien : DataPasien
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tagihan Tindakan Pasien")
                .font(.custom("PlusJakartaSans-Semibold", size: 18))
                .foregroundColor(Color("Title"))
                .padding()
            VStack{
                HStack {
                    Text("Tindakan")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 200, alignment: .leading)
                    Spacer()
                   
                    Text("Kode")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 120, alignment: .leading)
                    Spacer()
                    Text("Biaya")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 150, alignment: .leading)
//                    Spacer()
//                    Text("Tindakan")
//                        .font(.custom("PlusJakartaSans-Medium", size: 16))
//                        .foregroundColor(Color("Gray"))
//                        .frame(width: 100, alignment: .center)
                    
                    
                }
            }
            .padding()
            .frame(height: 54)
            
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            
            .cornerRadius(10)
            
  
            
            VStack {
                
                ForEach(dataPasien.drug_carts.indices, id: \.self) { index in
                    let action = dataPasien.action_carts[index]
                    TagihanPasienListTable(actionCart: action)
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
                Text("Rp.\(dataPasien.action_carts_total_price)")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(Color("RegularText"))
                    .frame(width: 150, alignment: .leading)
                
                
            }
            
            .padding()
            .frame(height: 54)
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            .cornerRadius(10)
            
            
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

//struct TagihanTindakanPasienList_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        TagihanTindakanPasienList().previewInterfaceOrientation(.landscapeRight)
//        
//    }
//}

