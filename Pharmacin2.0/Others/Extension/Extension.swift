//
//  Extension.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 22/03/24.
//

import Foundation
import SwiftUI

extension String {
    func filterNumericInput() -> String {
        // Create a character set containing digits (0-9)
        let digitCharacterSet = CharacterSet(charactersIn: "0123456789")
        
        // Invert the digit character set to get a set containing non-digits
        let nonDigitCharacterSet = digitCharacterSet.inverted
        
        // Filter the string to keep only digits
        let filteredString = self.components(separatedBy: nonDigitCharacterSet).joined()
        
        return filteredString
    }
    
    func formatCurrencyText(_ text: String) -> String {
        var formattedText = ""
        var counter = 0
        for char in text.reversed() {
            if counter % 3 == 0 && counter != 0 {
                formattedText.insert(".", at: formattedText.startIndex)
            }
            formattedText.insert(char, at: formattedText.startIndex)
            counter += 1
        }
        return formattedText
    }
}


struct LoadingViewModifier: ViewModifier {
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
                .opacity(isLoading ? 0.5 : 1.0)
                .background(Color.black)
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
        }
    }
}

extension View {
    func loadingView(isLoading: Binding<Bool>) -> some View {
        self.modifier(LoadingViewModifier(isLoading: isLoading))
    }
}
