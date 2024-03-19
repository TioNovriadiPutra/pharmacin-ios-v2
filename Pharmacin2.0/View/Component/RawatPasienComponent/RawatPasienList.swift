//
//  RawatPasienList.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct RawatPasienList: View {
    @Binding var showingDeletePopUp: Bool
    @Binding var showingPanggilPasienPopUp: Bool
    @Binding var pasienToCall: Pasien?
    var nomorAntrian: Int
    
    var pasien : Pasien
    
    var body: some View {
        
        HStack(spacing: 35){
            HStack{
                Text("\(nomorAntrian)")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(Color("Red"))
                    .frame(width: 50, alignment: .leading)
                VStack(alignment: .leading, spacing: 7){
                    Text("\(pasien.full_name)")
                        .font(.custom("PlusJakartaSans-Regular", size: 14))
                        .foregroundColor(Color("RegularText"))
                    
                    Text("\(pasien.record_number)")
                        .font(.custom("PlusJakartaSans-Regular", size: 12))
                        .foregroundColor(Color("Gray"))
                }
                .frame(width: 300, alignment: .leading)
            }
            Text("\(pasien.registration_number)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("Gray"))
            
                .frame(width: 160, alignment: .leading)
            
            Spacer()
            
            if pasien.status == "Belum Dipanggil"{
                StatusAntrianBelumDipanggil()
                    .frame(width: 160, alignment: .leading)
            }else{
                StatusAntrianSudahDipanggil()
                    .frame(width: 160, alignment: .leading)
            }
            
            Spacer()
            if pasien.status == "Belum Dipanggil"{
                HStack(spacing:14){
                    Button{
                        print("Check")
                        pasienToCall = pasien
                        showingPanggilPasienPopUp = true
                    }label: {
                        ActionButton(title: "Panggil", width: 74, height: 32, radius: 8, bgColor: "Green")
                    }
                    Button{
                        print("Delete")
                        showingDeletePopUp = true
                        pasienToCall = pasien
                    }label: {
                        Image("CrossRed")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
                .frame(width: 100, alignment: .trailing)
            }
            else{
                HStack{
                    Button{
                        print("Delete")
                        showingDeletePopUp = true
                        pasienToCall = pasien
                    }label: {
                        Image("CrossRed")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                } .frame(width: 100, alignment: .center)
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
