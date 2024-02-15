//
//  DashboardCard.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DashboardCard: View {
    let title: String
    let value: String
    let image: String
    let sizeValue: Int
    
    init(_ text: String, value:String, image:String, sizeValue: Int) {
        self.title = text
        self.value = value
        self.image = image
        self.sizeValue = sizeValue
    }
    
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 10)
            {
                Text(title)
                    .font(.custom("PlusJakartaSans-Medium", size: 14))
                    .foregroundColor(Color("Gray"))
                Text(value)
                    .font(.custom("PlusJakartaSans-semiBold", size: CGFloat(sizeValue)))
                    .foregroundColor(Color("Title"))
                    .padding(.top,1)
            }
            Spacer()
            Image(image)
        }
        .padding(.horizontal,25)
        .frame(height: 112)
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(10)
        
    }
    
}


#Preview {
    DashboardCard("Total Transaksi Jual", value: "190", image: "DashboardIcon", sizeValue: 20)
}

