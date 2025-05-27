//
//  HeaderView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("NutriLog")
                .font(Fonts.headerTitle)
                .foregroundColor(
                    Color(red: 216 / 255, green: 224 / 255, blue: 172 / 255)
                )
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 12)
        .background(
            Color(
                red: 99 / 255,
                green: 105 / 255,
                blue: 64 / 255
            )
        )
    }
}

#Preview {
    HeaderView()
}
