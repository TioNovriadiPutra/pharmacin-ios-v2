//
//  TagihanObatNonRacikanApotekListTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct ObatNonRacikanApotekListTable: View {
    var drug : DrugCart
    var body: some View {
        HStack {
            Text("\(drug.drug_name)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 300, alignment: .leading)
            Spacer()
            Text("\(drug.quantity)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 80, alignment: .leading)
            Spacer()
            Text("\(drug.unit_name)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 120, alignment: .leading)
            Spacer()
            Text("\(drug.instruction)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 200, alignment: .leading)
            Spacer()
            Text("\(drug.total_price)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 150, alignment: .leading)
            
        }
        .padding()

    }
}

//#Preview {
//    ObatNonRacikanApotekListTable()
//}
