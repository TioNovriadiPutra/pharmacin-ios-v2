//
//  ContentView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activeView: ActiveView = .Dashboard
    @State private var showingPopUpRawatPasienDelete = false
    @State private var showingPopUpKasirDelete = false
    @State private var showingPopUpApotekDelete = false


    
    var body: some View {
        
            GeometryReader { geometry in
            ZStack {
                
                
                VStack{
                    HStack {
                        SidebarView(activeView: $activeView)
                        
                         
                        getViewForActiveView()
                        
                        Spacer()
                    }
                }
                
                
                if showingPopUpRawatPasienDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpRawatPasienDelete = false
                        }
                    
                    RawatPasienPopUp(tutupPopUp: $showingPopUpRawatPasienDelete)
                }
                
                if showingPopUpKasirDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpKasirDelete = false
                        }
                    
                    RawatPasienPopUp(tutupPopUp: $showingPopUpKasirDelete)
                }
                
                if showingPopUpApotekDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpApotekDelete = false
                        }
                    
                    RawatPasienPopUp(tutupPopUp: $showingPopUpApotekDelete)
                }
            }.ignoresSafeArea(.keyboard)
        }
     }
    
    @ViewBuilder
    func getViewForActiveView() -> some View {
        switch activeView {
        case .Dashboard:
            DashboardView()
        case .RawatPasien:
            RawatPasienView(showPopUpDelete: $showingPopUpRawatPasienDelete)
        case .Kasir:
            KasirView(showPopUpDeleteKasir: $showingPopUpKasirDelete)
        case .Apotek:
            ApotekPengambilanObatView(isShowingPopUpView: $showingPopUpApotekDelete)
        }
    }

}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}
