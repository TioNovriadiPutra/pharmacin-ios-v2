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

    func tambahObatBaru(obat: Obat) {
        listObat.append(obat)
    }
    
    func updateItem(at index: Int, with newObat: Obat) {
        listObat[index] = newObat
    }
    
    var body: some View {
        
            GeometryReader { geometry in
            ZStack {
                
                
                VStack{
                    HStack(spacing:0){
                        SidebarKaryawanView(activeView: $activeView)
                        
                         
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

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        MainViewKaryawan().previewInterfaceOrientation(.landscapeRight)
    }
}
