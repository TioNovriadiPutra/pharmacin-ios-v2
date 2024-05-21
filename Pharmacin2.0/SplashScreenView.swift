//
//  SplashScreenView.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 08/04/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        Image("SplashScreen")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashScreenView()
}
