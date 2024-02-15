//
//  TagihanObatRacikanApotek.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ObatRacikanApotek: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Obat Racikan")
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
                
                ObatRacikanApotekListTable()
                ObatRacikanApotekListTable()
                ObatRacikanApotekListTable()
                
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
                Text("Rp.222.000.000")
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

struct TagihanObatRacikanApotek_Previews: PreviewProvider {
    static var previews: some View {
        
        ObatRacikanApotek().previewInterfaceOrientation(.landscapeRight)
        
    }
}

