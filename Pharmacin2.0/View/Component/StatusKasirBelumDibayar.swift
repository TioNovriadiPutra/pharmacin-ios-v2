//
//  StatusKasirBelumDibayar.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct StatusKasirBelumDibayar: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 125, height: 34)
                .cornerRadius(6)
                .foregroundColor(Color(red: 1, green: 0.89, blue: 0.89))
            
            Text("Belum dibayar")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .foregroundColor(Color("Red"))
        }
    }
}

#Preview {
    StatusKasirBelumDibayar()
}
