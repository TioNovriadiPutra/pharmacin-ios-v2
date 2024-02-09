//
//  TagihanNonRacikanListTable.swift
//  Pharmacin2.0
//
//  Created by Devin Maleke on 08/02/24.
//

import SwiftUI

struct TagihanObatNonRacikanListTable: View {
    var body: some View {
        HStack {
            Text("OBAT SJDH SISJ DSISMDH")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 200, alignment: .leading)
            Spacer()
            Text("10")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 80, alignment: .leading)
            Spacer()
            Text("Sachet")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 120, alignment: .leading)
            Spacer()
            Text("3 x 1 setelah makan")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 200, alignment: .leading)
            Spacer()
            Text("222.000.000")
                .font(.custom("PlusJakartaSans-Regular", size: 14))
                .foregroundColor(Color("RegularText"))
                .frame(width: 150, alignment: .leading)
            Spacer()
            Button {
                
            } label: {
                Image("CrossRed")
                    .frame(width: 100, alignment: .center)
            }

            
            


        }
        .padding()

    }
}

#Preview {
    TagihanObatNonRacikanListTable()
}
