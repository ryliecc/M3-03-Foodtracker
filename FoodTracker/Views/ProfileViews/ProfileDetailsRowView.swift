//
//  ProfileDetailsRow.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct ProfileDetailsRowView: View {
    var firstText: String
    var secondText: String
    var body: some View {
        GridRow {
            Text(firstText)
                .font(Fonts.profileLabel)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            Text(secondText)
                .font(Fonts.profileValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    var firstText = "Titel:"
    var secondText = "Irgendwas"
    ProfileDetailsRowView(firstText: firstText, secondText: secondText)
}
