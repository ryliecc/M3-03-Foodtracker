//
//  CircularProgressView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: Double
    var centerText: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("SecondaryColor"), lineWidth: 20)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color("PrimaryColor"),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
            Text(centerText)
                .font(Fonts.dashboardCalories)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("PrimaryColor"))
        }
        .frame(width: 220, height: 220)
    }
}

#Preview {
    var progress = 0.75
    var text = "1.043\nkcal"
    CircularProgressView(progress: progress, centerText: text)
}
