//
//  AllMacrosProgressView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct AllMacrosProgressView: View {
    var carbohydrateProgress: Double
    var carbohydrateSum: Double
    var proteinProgress: Double
    var proteinSum: Double
    var fatProgress: Double
    var fatSum: Double
    
    var body: some View {
        HStack {
            CircularMacroProgressView(progress: carbohydrateProgress, sum: carbohydrateSum, macro: "Carbohydrate")
            CircularMacroProgressView(progress: proteinProgress, sum: proteinSum, macro: "Protein")
            CircularMacroProgressView(progress: fatProgress, sum: fatSum, macro: "Fat")
        }
    }
}

#Preview {
    let carbohydrateProgress = 0.75
    let carbohydrateSum = 183.5
    let proteinProgress = 1.25
    let proteinSum = 198.0
    let fatProgress = 0.35
    let fatSum = 10.3
    AllMacrosProgressView(carbohydrateProgress: carbohydrateProgress, carbohydrateSum: carbohydrateSum, proteinProgress: proteinProgress, proteinSum: proteinSum, fatProgress: fatProgress, fatSum: fatSum)
}
