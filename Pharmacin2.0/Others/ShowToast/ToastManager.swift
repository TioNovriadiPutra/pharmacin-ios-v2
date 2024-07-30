//
//  ToastManager.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 20/07/24.
//

import SwiftUI

class ToastManager: ObservableObject {
    @Published var message: String?
    @Published var showToast: Bool = false
    
    func show(message: String, duration: TimeInterval = 2.0) {
        self.message = message
        self.showToast = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                self.showToast = false
            }
        }
    }
}
