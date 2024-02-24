//
//  MainViewAsistenDokter.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 24/02/24.
//

import SwiftUI

struct MainViewAsistenDokter: View {
    @State private var showingPopUpRawatPasienDelete = false
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {

                VStack{
                    HStack(spacing:0){
                        SideBarAsistenDokterView()
                        
                        
                        getViewForActiveView()
                        
                        Spacer()
                    }.background( Color(red: 0.98, green: 0.98, blue: 0.99))
                }
                
                
                if showingPopUpRawatPasienDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpRawatPasienDelete = false
                        }
                    
                    RawatPasienPopUp(tutupPopUp: $showingPopUpRawatPasienDelete)
                }

            }.ignoresSafeArea(.keyboard)
        }
    }
    
    @ViewBuilder
    func getViewForActiveView() -> some View {
            RawatPasienView(showPopUpDelete: $showingPopUpRawatPasienDelete)

    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainViewAsistenDokter().previewInterfaceOrientation(.landscapeRight)
    }
}
