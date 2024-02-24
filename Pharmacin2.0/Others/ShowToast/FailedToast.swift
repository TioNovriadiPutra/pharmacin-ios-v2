//
//  FailedToast.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import SwiftUI

struct FailedToast: View {
    let message: String
    
    init(message: String) {
        self.message = message
    }
    var body: some View {
        VStack{
            Spacer()
            HStack{
                
                ZStack{
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color("Red"))
                    Image("FailedCross")
                }
                .padding(.leading,20)
                
                Text(message)
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .foregroundColor(Color("RegularText"))
                    .lineLimit(1)
                    .padding(.horizontal,8)
                
                Spacer()
            }
            .frame(width: 322, height: 52)
            .background(Color(red: 1, green: 0.89, blue: 0.89))
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .inset(by: 0.50)
                    .stroke(Color(red: 0.85, green: 0.37, blue: 0.37), lineWidth: 0.50)
            )
            
            .padding(.bottom,50)
        }
        
    }
}

#Preview {
    FailedToast(message: "Error")
}

