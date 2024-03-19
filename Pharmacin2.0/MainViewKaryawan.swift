//
//  ContentView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct MainViewKaryawan: View {
    @State private var activeView: ActiveView = .Dashboard
    @State private var showingPopUpKasirDelete = false
    @State private var showingPopUpApotekDelete = false

    @State private var showingPopUpTambahObat = false
    @State private var editObatIndex: Int? = nil
    @State private var isEditing: Bool = false
    @State private var listObat: [Obat] = []
    @State private var showKonfirmasiPembayaranKasir = false
    
    @State private var logOut = false
    
    
    
    

    func tambahObatBaru(obat: Obat) {
        listObat.append(obat)
    }
    
    func updateItem(at index: Int, with newObat: Obat) {
        listObat[index] = newObat
    }
    
    var body: some View {
//        NavigationStack{
        GeometryReader { geometry in
            ZStack {
                
                
                VStack{
                    HStack(spacing:0){
                        SidebarKaryawanView(activeView: $activeView, logOut: $logOut)
                        
                        
                        getViewForActiveView()
                        
                        Spacer()
                    }.background( Color(red: 0.98, green: 0.98, blue: 0.99))
                }
                
                if showingPopUpKasirDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpKasirDelete = false
                        }
                    
                    PopUpDeleteKasir(showPopUpDeleteKasir: $showingPopUpKasirDelete)
                }
                
                
                if showingPopUpApotekDelete {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopUpApotekDelete = false
                        }
                    
                    PopUpDeletePengambilanObat(showPopUpPengambilanKasir: $showingPopUpApotekDelete)
                }
                
                if logOut {
                    Color.black.opacity(0.4) // Background overlay
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            logOut = false
                        }
                    
                    PopUpLogOut(showLogoutPopUp: $logOut)
                }
                
                if showingPopUpTambahObat{
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                showingPopUpTambahObat = false
                            }
                        
                        TambahObatPopUp(listObat: $listObat,
                                        tambahObatBaru: tambahObatBaru,
                                        obatToEdit: editObatIndex != nil && listObat.indices.contains(editObatIndex!) ? listObat[editObatIndex!] : nil,
                                        isEditing: $isEditing, showPopUp: $showingPopUpTambahObat)
                        
                    }
                }
                
                if showKonfirmasiPembayaranKasir{
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                showingPopUpTambahObat = false
                            }
                        
                        KonfirmasiPembayaranPopUp(showKonfirmsasiPembayaranPopup: $showKonfirmasiPembayaranKasir)
                        
                    }
                    
                }
            }.ignoresSafeArea(.keyboard)
        }
//    }
     }
    
    @ViewBuilder
    func getViewForActiveView() -> some View {
        switch activeView {
        case .Dashboard:
            DashboardView()
        case .Kasir:
            KasirView(showPopUpDeleteKasir: $showingPopUpKasirDelete, listObat: $listObat, isShowPopUp: $showingPopUpTambahObat, editObatIndex: $editObatIndex, isEditing: $isEditing, isShowKonfirmasiPembayaran: $showKonfirmasiPembayaranKasir)
        
        case .Apotek:
            ApotekPengambilanObatView(isShowingPopUpView: $showingPopUpApotekDelete)
        }
    }

}

struct MainViewKaryawan_Preview: PreviewProvider {
    static var previews: some View {
        MainViewKaryawan().previewInterfaceOrientation(.landscapeRight)
    }
}
