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
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 250, height: 250)
            Circle()
                .stroke(Color("SecondaryColor"), lineWidth: 20)
                .frame(width: 220, height: 220)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color("PrimaryColor"),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 220, height: 220)
            if progress > 1.0 {
                            Circle()
                                .trim(from: 0, to: progress - 1.0)
                                .stroke(Color("PrimaryColor"),
                                        style: StrokeStyle(lineWidth: 20, lineCap: .round))
                                .rotationEffect(.degrees(-90 + 360))
                                .frame(width: 220, height: 220)
                            Circle()
                                .fill(Color("PrimaryColor"))
                                .frame(width: 20, height: 20)
                                .shadow(color: Color(.black), radius: 8, x: 14, y: 0)
                                .offset(x: 0, y: -110)
                                .rotationEffect(.degrees((progress - 1.0) * 360))
                                .frame(width: 220, height: 220)
                        }
            Circle()
                .stroke(Color(.white), lineWidth: 16)
            Circle()
                .fill(.white)
                .frame(width: 200)
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
    CircularProgressView(progress: progress, centerText: text)
}
