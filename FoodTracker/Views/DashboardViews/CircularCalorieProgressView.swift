//
//  CircularProgressView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import SwiftUI

struct CircularCalorieProgressView: View {
    var progress: Double
    var centerText: String
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("SecondaryColor"), lineWidth: 30)
                .frame(width: 220, height: 220)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color("PrimaryColor"),
                    style: StrokeStyle(lineWidth: 30, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 220, height: 220)
            if progress > 1.0 {
                            Circle()
                                .trim(from: 0, to: progress - 1.0)
                                .stroke(Color("PrimaryColor"),
                                        style: StrokeStyle(lineWidth: 30, lineCap: .round))
                                .rotationEffect(.degrees(-90 + 360))
                                .frame(width: 220, height: 220)
                            Circle()
                                .fill(Color("PrimaryColor"))
                                .frame(width: 30, height: 30)
                                .shadow(color: Color(.black), radius: 8, x: 14, y: 0)
                                .offset(x: 0, y: -110)
                                .rotationEffect(.degrees((progress - 1.0) * 360))
                                .frame(width: 220, height: 220)
                        }
            Circle()
                .stroke(Color(.white), lineWidth: 14)
                .frame(width: 266, height: 266)
            Circle()
                .fill(.white)
                .frame(width: 188)
            Text(centerText)
                .font(Fonts.dashboardCalories)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("PrimaryColor"))
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    var progress = 1.1
    var text = "1.043\nkcal"
    CircularCalorieProgressView(progress: progress, centerText: text)
}
