//
//  ProfileFormGoalsView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI

struct ProfileFormGoalsView: View {
    var newUserCalorieGoal: Int
    var newUserCarbohydrateGoal: Double
    var newUserProteinGoal: Double
    var newUserFatGoal: Double

    var body: some View {
        Section("Ernährungsziele") {
                Text("Kalorien: \(newUserCalorieGoal) kcal")
                    .foregroundColor(Color("PrimaryColor"))
                    .bold()
                Text(
                    "Kohlenhydrate: \(newUserCarbohydrateGoal.formattedGrams)"
                )
                .foregroundColor(Color("CarbohydratePrimaryColor"))
                .bold()
                Text(
                    "Protein: \(newUserProteinGoal.formattedGrams)"
                )
                .foregroundColor(Color("ProteinPrimaryColor"))
                .bold()
                Text("Fett: \(newUserFatGoal.formattedGrams)")
                    .foregroundColor(Color("FatPrimaryColor"))
                    .bold()
        }
    }
}

#Preview {
    @Previewable var newUserCalorieGoal = 2000
    @Previewable var carbGoal = 200.0
    @Previewable var proteinGoal = 100.0
    @Previewable var fatGoal = 50.0

    ProfileFormGoalsView(newUserCalorieGoal: newUserCalorieGoal,
        newUserCarbohydrateGoal: carbGoal,
        newUserProteinGoal: proteinGoal,
        newUserFatGoal: fatGoal
    )
}
