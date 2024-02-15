//
//  ButtonSideBar.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ButtonSideBar: View {
    let backgroundColor: String
    let image: String
    
    init(backgroundColor: String, image: String) {
        self.backgroundColor = backgroundColor
        self.image = image
    }
    
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width: 32, height: 32)
        }
        .padding(EdgeInsets(top: 84, leading: 5, bottom: 84, trailing: 5))
        .frame(width: 42, height: 82)
        .background(Color(backgroundColor))
        .cornerRadius(10)
    }
}

#Preview {
    ButtonSideBar(backgroundColor: "Green", image: "DashboardIcon")
}
