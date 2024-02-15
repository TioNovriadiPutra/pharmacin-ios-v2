//
//  DetailApotekView.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DetailApotekView: View {
    @State private var searchText: String = ""
    let searchPaymentList = ["Red", "Green", "Blue", "Black", "Tartan"]
    @State private var searchName: String = ""
    @State private var selectionPayment = ""
    @State private var searchPayment: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    Color(red: 0.98, green: 0.98, blue: 0.99)
                        .ignoresSafeArea()
                    
                    VStack(spacing:14){
                        
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image("BackIcon")
                            })
                            
                            
                            Spacer()
                            
                            HStack{
                                Text("Detail Obat Pasien")
                                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                                    .foregroundColor(Color("RegularText"))
                                
                                Text("(Belum Diproses)")
                                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                                    .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image("CheckIcon")
                            })
                            
                            
                        }
                        .padding()
                        .background()
                        .frame(height: 44)
                        
                        .cornerRadius(10)
                        
                        ScrollView{
                            VStack(spacing:14){
                                DetailApotekHeader()
                                
                                
                                ObatNonRacikanApotek()
                                ObatRacikanApotek()
                            }
                        }
                        
                        
                    }
                    
                }
            }
        }
    }
}

struct DetailApotekView_Previews: PreviewProvider {
    static var previews: some View {
        
        DetailApotekView().previewInterfaceOrientation(.landscapeRight)
        
    }
}
