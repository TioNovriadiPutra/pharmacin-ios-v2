//
//  EmptyCellView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 30/07/24.
//

import SwiftUI

struct EmptyCellView: View {
    var body: some View {
        VStack{
            Image("EmptyCell")
                .resizable()
                .frame(width: 170, height: 170)
            
            Text("Tarik untuk Memperbarui")
                .font(.custom("PlusJakartaSans-Bold", size: 16))
                .padding()
            
            
            VStack{
                Text("Tips: ")
                    
                    .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                    .foregroundColor(Color("Gray"))
                    .italic()
                +
                Text("Jika antrian tidak muncul, pastikan koneksi internet Anda stabil dan coba lagi.")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                    .foregroundColor(Color("Gray"))
                
            }
            .frame(width: 320)
            .multilineTextAlignment(.center)
            
            
        }
        
    }
}

#Preview {
    EmptyCellView()
}
