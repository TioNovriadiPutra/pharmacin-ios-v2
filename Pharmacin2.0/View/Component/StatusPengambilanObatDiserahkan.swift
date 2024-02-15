//
//  StatusPengambilanObatDiserahkan.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct StatusPengambilanObatDiserahkan: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 135, height: 34)
                .cornerRadius(6)
                .foregroundColor(Color(red: 0.84, green: 0.98, blue: 0.85))
            
            Text("Obat diserahkan")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .foregroundColor(Color("Green"))
        }
    }
}

#Preview {
    StatusPengambilanObatDiserahkan()
}
