//
//  ProfileFormGoalsView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI

struct ProfileFormGoalsView: View {
    @Binding var useRecommendedSettings: Bool
    @Binding var newUserCalorieGoal: Int
    var bmr: Int
    @Binding var newUserActivityLevel: ActivityLevel
    @Binding var newUserWeightGoal: WeightGoal
    @Binding var newUserDiet: Diet
    @Binding var newUserCarbohydrateGoal: Double
    @Binding var newUserProteinGoal: Double
    @Binding var newUserFatGoal: Double

    var recommendedCalorieGoal: Int {
        let calorieRequirement: Int = Int(
            Double(bmr) * newUserActivityLevel.activityFactor
        )
        let goalAdjustment: Int = Int(
            Double(calorieRequirement) / 100
                * newUserWeightGoal.calorieGoalAdjustment
        )
        return calorieRequirement + goalAdjustment
    }
    var recommendedCarbohydrateInGramGoal: Double {
        (Double(newUserCalorieGoal) * newUserDiet.carbohydratePercentage) / 4
    }
    var recommendedProteinInGramGoal: Double {
        (Double(newUserCalorieGoal) * newUserDiet.proteinPercentage) / 4
    }
    var recommendedFatInGramGoal: Double {
        (Double(newUserCalorieGoal) * newUserDiet.fatPercentage) / 9
    }

    var calorieRange: [Int] {
        Array(stride(from: 0, through: 5000, by: 1))
    }
    var macroRange: [Double] {
        Array(stride(from: 0.0, through: 1000, by: 0.1))
    }

    var body: some View {
        Section("Ernährungsziele") {
            Toggle(
                "Empfohlene Einstellungen",
                isOn: $useRecommendedSettings
            )
            .onChange(of: useRecommendedSettings) {
                if !useRecommendedSettings {
                    newUserCalorieGoal = recommendedCalorieGoal
                    newUserCarbohydrateGoal = recommendedCarbohydrateInGramGoal
                    newUserProteinGoal = recommendedProteinInGramGoal
                    newUserFatGoal = recommendedFatInGramGoal
                }
            }
            if useRecommendedSettings {
                Text("Kalorien: \(recommendedCalorieGoal) kcal")
                    .foregroundColor(Color("PrimaryColor"))
                    .bold()
                Text(
                    "Kohlenhydrate: \(recommendedCarbohydrateInGramGoal.formattedGrams)"
                )
                .foregroundColor(Color("CarbohydratePrimaryColor"))
                .bold()
                Text(
                    "Protein: \(recommendedProteinInGramGoal.formattedGrams)"
                )
                .foregroundColor(Color("ProteinPrimaryColor"))
                .bold()
                Text("Fett: \(recommendedFatInGramGoal.formattedGrams)")
                    .foregroundColor(Color("FatPrimaryColor"))
                    .bold()
            } else {
                Picker("Kalorien", selection: $newUserCalorieGoal) {
                    ForEach(calorieRange, id: \.self) { calorie in
                        Text("\(calorie) kcal").tag(calorie)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 80)
                .clipped()
                HStack {
                    Text("Kohlenhydrate:")
                        .font(Fonts.entryTitle)
                        .foregroundColor(Color("CarbohydratePrimaryColor"))
                        .frame(width: 160, alignment: .leading)
                    Picker(
                        "Kohlenhydrate",
                        selection: $newUserCarbohydrateGoal
                    ) {
                        ForEach(macroRange, id: \.self) { macro in
                            Text(String(format: "%.1f g", macro)).tag(macro)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 160, height: 80)
                    .clipped()
                }
                HStack {
                    Text("Protein:")
                        .font(Fonts.entryTitle)
                        .foregroundColor(Color("ProteinPrimaryColor"))
                        .frame(width: 160, alignment: .leading)
                    Picker("Protein", selection: $newUserProteinGoal) {
                        ForEach(macroRange, id: \.self) { macro in
                            Text(String(format: "%.1f g", macro)).tag(macro)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 160, height: 80)
                    .clipped()
                }
                HStack {
                    Text("Fett:")
                        .font(Fonts.entryTitle)
                        .foregroundColor(Color("FatPrimaryColor"))
                        .frame(width: 160, alignment: .leading)
                    Picker("Fett", selection: $newUserFatGoal) {
                        ForEach(macroRange, id: \.self) { macro in
                            Text(String(format: "%.1f g", macro)).tag(macro)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 160, height: 80)
                    .clipped()
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var useSettings: Bool = true
    @Previewable @State var newUserCalorieGoal = 2000
    @Previewable var bmr = 1500
    @Previewable @State var activityLevel: ActivityLevel = .medium
    @Previewable @State var weightGoal: WeightGoal = .maintain
    @Previewable @State var diet: Diet = .omnivore
    @Previewable @State var carbGoal = 200.0
    @Previewable @State var proteinGoal = 100.0
    @Previewable @State var fatGoal = 50.0

    ProfileFormGoalsView(useRecommendedSettings: $useSettings,
        newUserCalorieGoal: $newUserCalorieGoal,
        bmr: bmr,
        newUserActivityLevel: $activityLevel,
        newUserWeightGoal: $weightGoal,
        newUserDiet: $diet,
        newUserCarbohydrateGoal: $carbGoal,
        newUserProteinGoal: $proteinGoal,
        newUserFatGoal: $fatGoal
    )
}
