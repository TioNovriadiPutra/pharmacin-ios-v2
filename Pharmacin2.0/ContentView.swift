//
//  ContentView.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var roleID: Int? // Menyimpan roleID setelah login

    var body: some View {
        
            if let roleID = roleID {
                // Tampilkan view sesuai dengan roleID
                switch roleID {
                    case 3:
                        MainViewKaryawan()
                    case 4:
                        MainViewAsistenDokter()
                    default:
                        Text("Role tidak valid")
                }
            } else {
                // Halaman login
                LoginView(roleID: $roleID)
            }
        
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
