//
//  CircularMacroProgressView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct CircularMacroProgressView: View {
    var progress: Double
    var sum: Double
    var macro: String
    
    var primaryColor: Color {
        switch macro {
        case "Carbohydrate": return Color("CarbohydratePrimaryColor")
        case "Protein": return Color("ProteinPrimaryColor")
        default: return Color("FatPrimaryColor")
        }
    }
    var secondaryColor: Color {
        switch macro {
        case "Carbohydrate": return Color("CarbohydrateSecondaryColor")
        case "Protein": return Color("ProteinSecondaryColor")
        default: return Color("FatSecondaryColor")
        }
    }
    var categoryText: String {
        switch macro {
        case "Carbohydrate": return "Kohlenhydrate"
        case "Protein": return "Protein"
        default: return "Fett"
        }
    }

    var body: some View {
        VStack(alignment: .center) {
            Text(categoryText)
                .font(Fonts.dashboardMacrosTitle)
                .foregroundColor(primaryColor)
            ZStack {
                Circle()
                    .stroke(
                        secondaryColor,
                        style: StrokeStyle(lineWidth: 16, lineCap: .round)
                    )
                    .frame(width: 90, height: 90)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        primaryColor,
                        style: StrokeStyle(lineWidth: 16, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 90, height: 90)
                if progress > 1.0 {
                    Circle()
                        .trim(from: 0, to: progress - 1.0)
                        .stroke(
                            primaryColor,
                            style: StrokeStyle(lineWidth: 16, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90 + 360))
                        .frame(width: 90, height: 90)
                    Circle()
                        .fill(primaryColor)
                        .frame(width: 20, height: 20)
                        .shadow(color: Color(.black), radius: 8, x: 16, y: 0)
                        .offset(x: 0, y: -45)
                        .rotationEffect(
                            .degrees((progress - 1.0) * 360)
                        )
                        .frame(width: 90, height: 90)
                }
                Circle()
                    .stroke(Color(.white), lineWidth: 18)
                    .frame(width: 124)
                Circle()
                    .fill(.white)
                    .frame(width: 74)
                Text(sum.formattedGrams)
                    .font(Fonts.dashboardMacros)
                    .multilineTextAlignment(.center)
                    .foregroundColor(primaryColor)
            }
        }
    }
}

#Preview {
    var progress: Double = 1.75
    var sum: Double = 200.6
    CircularMacroProgressView(
        progress: progress,
        sum: sum,
        macro: "Carbohydrate"
    )
}
