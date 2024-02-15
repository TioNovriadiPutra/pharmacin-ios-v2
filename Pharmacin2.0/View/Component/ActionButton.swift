//
//  ActionButton.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    let width: CGFloat
    let height: CGFloat
    let radius: CGFloat
    let bgColor: String
    
    init(title: String, width: Int, height: Int, radius: Int, bgColor: String) {
        self.title = title
        self.width = CGFloat(width)
        self.height = CGFloat(height)
        self.radius = CGFloat(radius)
        self.bgColor = bgColor
    }
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Plus Jakarta Sans", size: 16).weight(.semibold))
                .foregroundColor(.white)
        }
        .frame(width: width, height: height)
        .background(Color(bgColor))
        .cornerRadius(radius)
    }
}

#Preview {
    ActionButton(title: "Panggil", width: 266, height: 44, radius: 10, bgColor: "Green")
}
