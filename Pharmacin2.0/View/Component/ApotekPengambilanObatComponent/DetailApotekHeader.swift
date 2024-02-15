//
//  DetailApotekHeader.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct DetailApotekHeader: View {
    var body: some View {
            VStack{
                HStack (spacing:80){
                    VStack (alignment: .leading, spacing: 12){
                        HStack{
                            Text("No. Registrasi")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 120, alignment: .leading)
                            
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("REG/20230910/0012")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            
                        }
                        
                        HStack{
                            Text("No. RM")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 120, alignment: .leading)
                            
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                            Text("000000")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            
                        }
                        
                        HStack{
                            Text("Nama")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 120, alignment: .leading)
                            
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("Naufal Athallahardi")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                        }
                        
                        HStack{
                            Text("TTL")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 120, alignment: .leading)
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("Jakarta, 10 September 2001")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("(2 Tahun 3 Bulan)")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("LightGray"))
                            
                        }
                        
                        HStack{
                            Text("Alamat")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 120, alignment: .leading)
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("Jl. Al-Ikhlas No.2A  Rt.006/018 kp. Rawa Bogo Jatiasih")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            
                            
                        }
                        
                        Spacer()
                    }
                    
                    VStack (alignment: .leading, spacing: 12){
                        HStack{
                            Text("Tgl. Periksa")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 150, alignment: .leading)
                            
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("DD-MM-YYYY")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            
                        }
                        
                        HStack{
                            Text("Dokter")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 150, alignment: .leading)
                            
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            Text("dr. Lorem Ipsum")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("RegularText"))
                            
                        }
                        
                        HStack{
                            Text("Alergi")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Gray"))
                                .frame(width: 150, alignment: .leading)
                            
                            
                            Text(":")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Red"))
                            Text("Lorem Ipsum")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                                .foregroundColor(Color("Red"))
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
            .padding()
            .frame(height: 204)
            .background(.white)
            .cornerRadius(10)
        
    }
}

#Preview {
    DetailApotekHeader()
}
