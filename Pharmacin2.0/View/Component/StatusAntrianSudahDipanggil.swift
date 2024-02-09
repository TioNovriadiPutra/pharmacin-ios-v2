//
//  StatusAntrianSudahDipanggil.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct StatusAntrianSudahDipanggil: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 125, height: 34)
                .cornerRadius(6)
                .foregroundColor(Color(red: 0.84, green: 0.98, blue: 0.85))
            
            Text("Sudah dipanggil")
                .font(.custom("PlusJakartaSans-Medium", size: 14))
                .foregroundColor(Color("Green"))
        }
    }
}

#Preview {
    StatusAntrianSudahDipanggil()
}
