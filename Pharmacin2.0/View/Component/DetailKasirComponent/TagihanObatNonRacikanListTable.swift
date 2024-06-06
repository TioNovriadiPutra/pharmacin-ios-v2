//
//  TagihanNonRacikanListTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TagihanObatNonRacikanListTable: View {
    var drug : DrugCart
    @Binding var showPopUpDelete: Bool
    var deleteAction: () -> Void
    
    var body: some View {
        HStack {
            Text("\(drug.drug_name)")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 200, alignment: .leading)
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
            Spacer()
            Button {
                showPopUpDelete = true
                deleteAction()
            } label: {
                Image("CrossRed")
                    .frame(width: 100, alignment: .center)
            }

            
        }
        .padding()

    }
}

//#Preview {
//    TagihanObatNonRacikanListTable()
//}
