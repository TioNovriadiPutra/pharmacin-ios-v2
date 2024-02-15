//
//  RawatPasienList.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct RawatPasienList: View {
    @Binding var showingDeletePopUp: Bool
    
    var body: some View {
        
        HStack(spacing: 35){
            HStack{
                Text("1")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(Color("Red"))
                    .frame(width: 50, alignment: .leading)
                VStack(alignment: .leading, spacing: 7){
                    Text("No Invoice")
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .foregroundColor(Color("RegularText"))
                    
                    Text("No Invoice")
                        .font(.custom("PlusJakartaSans-Regular", size: 12))
                        .foregroundColor(Color("Gray"))
                }
                .frame(width: 300, alignment: .leading)
            }
            Text("REG/20230910/0012")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("Gray"))
                
                .frame(width: 160, alignment: .leading)
            
            Spacer()
            
            StatusAntrianBelumDipanggil()
            //                        .frame(width: 160, alignment: .leading)
            
            HStack(spacing:14){
                Button{
                    print("Check")
                }label: {
                    ActionButton(title: "Panggil", width: 74, height: 32, radius: 8, bgColor: "Green")
                    
                }
                Button{
                    print("Delete")
                    showingDeletePopUp = true
                }label: {
                    Image("CrossRed")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .padding(.horizontal)
        .padding()
        .frame(height: 68)
        .background(.white)
        .cornerRadius(10)
        
        
        
        
        
        
    }
}

//#Preview {
////    RawatPasienList()
//}
