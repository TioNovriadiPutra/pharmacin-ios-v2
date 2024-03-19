//
//  KasirList.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct KasirList: View {
    
    @Binding var showPopUpDeleteKasir : Bool
    @Binding var showDetailKasir: Bool
   
    var pasien : Pasien
    
    var nomorAntrian: Int
    
    var didSelectPasien: () -> Void
    
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
            if pasien.status == "drug-pick-up"{
                StatusKasirBelumDibayar()
                    .padding(.trailing,94)
            }else{
                StatusKasirSudahDibayar()
                    .padding(.trailing,94)
            }
//            StatusKasirBelumDibayar()
            //                        .frame(width: 160, alignment: .leading)
//                .padding(.trailing,94)
            HStack(spacing:14){
                Button{
                    print("Check")
                    showDetailKasir = true
                    didSelectPasien()
                }label: {
                    Image("InvoiceIcon")
                }
                Button{
                    print("Check")
                    showPopUpDeleteKasir = true
                    didSelectPasien()
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
//    KasirList()
//}
