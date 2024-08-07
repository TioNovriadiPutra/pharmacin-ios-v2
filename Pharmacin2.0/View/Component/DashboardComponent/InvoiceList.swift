//
//  InvoiceList.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct InvoiceList: View {
    var data : Selling
    var body: some View {
        HStack{
            Text("\(data.invoice_number)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 160, alignment: .leading)
            Spacer()
            Text("\(data.total_price)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 200, alignment: .leading)
        }
        .padding()
       
    }
}

//#Preview {
//    InvoiceList()
//}
