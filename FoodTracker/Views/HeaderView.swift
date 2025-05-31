//
//  HeaderView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "leaf")
                .font(.system(size: 48))
                .foregroundColor(Color("SecondaryColor"))
            Text("NutriLog")
                .font(Fonts.headerTitle)
                .foregroundColor(
                    Color("SecondaryColor")
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 12)
        .background(
            Color("PrimaryColor")
        )
    }
}

#Preview {
    HeaderView()
}
