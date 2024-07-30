//
//  SuccessToast.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import SwiftUI

struct SuccessToast: View {
    @EnvironmentObject var toastManager: ToastManager
    
    var body: some View {
        if toastManager.showToast {
        VStack{
            Spacer()
            HStack{
                
                ZStack{
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color("Green"))
                    Image("SuccessCheck")
                }
                .padding(.leading,20)
                
                Text(toastManager.message ?? "")
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .padding(.horizontal,8)
                Spacer()
            }
            .frame(width: 322, height: 52)
            
            .background(Color(red: 0.84, green: 0.98, blue: 0.85))
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .inset(by: 0.50)
                    .stroke(Color(red: 0.34, green: 0.75, blue: 0.39), lineWidth: 0.50)
            )
        }
        .padding(.bottom,50)
    }
    }
}

//#Preview {
//    SuccessToast(message: "Sukses")
//}
