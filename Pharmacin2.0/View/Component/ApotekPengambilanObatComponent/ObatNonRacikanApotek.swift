//
//  TagihanObatNonRacikanApotek.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ObatNonRacikanApotek: View {
    
    var dataPasien: DataPasienApotek
    var body: some View {
        VStack(alignment: .leading) {
            Text("Obat Non Racikan")
                .font(.custom("PlusJakartaSans-Semibold", size: 18))
                .foregroundColor(Color("Title"))
                .padding()
            VStack{
                HStack {
                    Text("Item")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(Color("Gray"))
                        .frame(width: 300, alignment: .leading)
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
                    
                }
            }
            .padding()
            .frame(height: 54)
            
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            
            .cornerRadius(10)
            
  
            
            VStack {
                ForEach(dataPasien.drug_carts.indices, id: \.self) { index in
                    let obat = dataPasien.drug_carts[index]
                    ObatNonRacikanApotekListTable(drug: obat)
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
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

//struct TagihanObatNonRacikanApotek_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        ObatNonRacikanApotek().previewInterfaceOrientation(.landscapeRight)
//        
//    }
//}

