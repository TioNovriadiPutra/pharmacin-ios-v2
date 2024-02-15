//
//  StatusPengambilanObatBelumDiserahkan.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct StatusPengambilanObatBelumDiserahkan: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 135, height: 34)
                .cornerRadius(6)
                .foregroundColor(Color(red: 1, green: 0.89, blue: 0.89))
            
            Text("Belum diserahkan")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .foregroundColor(Color("Red"))
        }
    }
}

#Preview {
    StatusPengambilanObatBelumDiserahkan()
}
