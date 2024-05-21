//
//  TagihanPasienListTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TagihanPasienListTable: View {
    
    var actionCart: ActionCart
    
    var body: some View {
        HStack {
            Text("\(actionCart.action_name)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 200, alignment: .leading)
            Spacer()
            Text("\(actionCart.id)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 120, alignment: .leading)
            Spacer()
            Text("\(actionCart.action_price)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 150, alignment: .leading)
            
        }
        .padding()

    }
}

//#Preview {
//    TagihanPasienListTable()
//}
