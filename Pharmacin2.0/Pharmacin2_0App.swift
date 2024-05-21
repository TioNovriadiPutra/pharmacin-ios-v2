//
//  Pharmacin2_0App.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

@main
struct Pharmacin2_0App: App {
    @StateObject var signInViewModel = SignInViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .colorScheme(.light)
                .environmentObject(signInViewModel)
        }
    }
}
