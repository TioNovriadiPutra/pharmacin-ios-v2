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
    @StateObject private var toastManager = ToastManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(signInViewModel)
                .environmentObject(toastManager)
                .overlay(SuccessToast().environmentObject(toastManager))
        }
    }
}
