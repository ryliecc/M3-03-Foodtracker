//
//  ProfileFormView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct ProfileFormView: View {
    @Binding var user: User
    @State var newUserName: String
    @State var newUserSex: Sex
    @State var newUserHeight: Double
    @State var newUserWeight: Double
    @State var newUserWeightGoal: WeightGoal
    @State var newUserActivityLevel: ActivityLevel
    var newUserCalorieGoal: Int {
        let calorieRequirement: Int = Int(
            Double(bmr) * newUserActivityLevel.activityFactor
        )
        let goalAdjustment: Int = Int(
            Double(calorieRequirement) / 100
                * newUserWeightGoal.calorieGoalAdjustment
        )
        return calorieRequirement + goalAdjustment
    }
    @State var newUserDiet: Diet
    var newUserCarbohydrateGoal: Double {
        (Double(newUserCalorieGoal) * newUserDiet.carbohydratePercentage) / 4
    }
    var newUserProteinGoal: Double {
        (Double(newUserCalorieGoal) * newUserDiet.carbohydratePercentage) / 4
    }
    var newUserFatGoal: Double {
        (Double(newUserCalorieGoal) * newUserDiet.carbohydratePercentage) / 9
    }
    @Binding var formIsVisible: Bool

    var bmi: Double { newUserWeight / pow(newUserHeight, 2) }
    var weightCategory: WeightCategory {
        switch bmi {
        case 0..<16.0: return .severeUnderweight
        case 16.0..<17.0: return .moderateUnderweight
        case 17.0..<18.5: return .mildUnderweight
        case 18.5..<25.0: return .normalWeight
        case 25.0..<30.0: return .overweight
        case 30.0..<35.0: return .obesityClassI
        case 35.0..<40.0: return .obesityClassIi
        default: return .obesityClassIii
        }
    }
    var bmr: Int {
        switch newUserSex {
        case .male: Int(newUserWeight * 24)
        case .female: Int(newUserWeight * 24 * 0.9)
        }
    }

    var weightRange: [Double] {
        Array(stride(from: 30.0, through: 200.0, by: 0.1))
    }
    var heightRange: [Double] {
        Array(stride(from: 1.40, through: 2.20, by: 0.01))
    }

    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $newUserName)
            }
            Section("Dominierende Hormone") {
                Picker("Geschlecht wählen:", selection: $newUserSex) {
                    Text("Testosteron").tag(Sex.male)
                    Text("Östrogen").tag(Sex.female)
                }
                .pickerStyle(.palette)
            }
            Section("Körpergewicht") {
                Picker("Gewicht", selection: $newUserWeight) {
                    ForEach(weightRange, id: \.self) { weight in
                        Text(String(format: "%.1f kg", weight)).tag(weight)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 100)
                .clipped()
            }
            Section("Körpergröße") {
                Picker("Größe", selection: $newUserHeight) {
                    ForEach(heightRange, id: \.self) { height in
                        Text(String(format: "%.2f m", height)).tag(height)
                    }
                }
                .pickerStyle(.wheel)
                .frame(height: 100)
                .clipped()
            }
            Section("BMI") {
                Text(
                    "BMI: \(String(format: "%.1f", bmi)) (\(weightCategory.rawValue))"
                )
                Picker("Ziel wählen:", selection: $newUserWeightGoal) {
                    ForEach(WeightGoal.allCases, id: \.self) { goal in
                        Text(goal.rawValue).tag(goal)
                    }
                }
            }
            Section("Aktivitätslevel") {
                Picker("Level wählen", selection: $newUserActivityLevel) {
                    ForEach(ActivityLevel.allCases, id: \.rawValue) {
                        level in
                        Text(level.rawValue).tag(level)
                    }
                }
            }
            Section("Ernährungsform") {
                Picker("Ernährung wählen", selection: $newUserDiet) {
                    ForEach(Diet.allCases, id: \.rawValue) {
                        diet in
                        Text(diet.rawValue).tag(diet)
                    }
                }
            }
            ProfileFormGoalsView(newUserCalorieGoal: newUserCalorieGoal, newUserCarbohydrateGoal: newUserCarbohydrateGoal, newUserProteinGoal: newUserProteinGoal, newUserFatGoal: newUserFatGoal)
            Section {
                HStack {
                    Button("Abbrechen") {
                        formIsVisible = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                Color("SecondaryColor")
                            )
                    )
                    .foregroundColor(Color("PrimaryColor"))
                    Button("Speichern") {
                        user.name = newUserName
                        user.sex = newUserSex
                        user.heightInMeter = newUserHeight
                        user.weightInKilogram = newUserWeight
                        user.weightGoal = newUserWeightGoal
                        user.activityLevel = newUserActivityLevel
                        user.calorieGoal = newUserCalorieGoal
                        user.diet = newUserDiet
                        user.carbohydrateInGramGoal = newUserCarbohydrateGoal
                        user.proteinInGramGoal = newUserProteinGoal
                        user.fatInGramGoal = newUserFatGoal
                        formIsVisible = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                Color("PrimaryColor")
                            )
                    )
                    .foregroundColor(Color("SecondaryColor"))
                }
            }
        }
    }

    init(user: Binding<User>, formIsVisible: Binding<Bool>) {
        self._user = user
        self._formIsVisible = formIsVisible
        self.newUserName = user.wrappedValue.name
        self.newUserSex = user.wrappedValue.sex
        self.newUserHeight = user.wrappedValue.heightInMeter
        self.newUserWeight = user.wrappedValue.weightInKilogram
        self.newUserActivityLevel = user.wrappedValue.activityLevel
        self.newUserWeightGoal = user.wrappedValue.weightGoal
        self.newUserDiet = user.wrappedValue.diet
    }
}

#Preview {
    @Previewable @State var user: User = User(name: "Rylie", sex: .male, heightInMeter: 1.64, weightInKilogram: 63.5, activityLevel: .low, weightGoal: .maintain, calorieGoal: 2095, diet: .veganRegular, carbohydrateInGramGoal: 261.9, proteinInGramGoal: 130.9, fatInGramGoal: 58.2)
    @Previewable @State var formIsVisible: Bool = true
    ProfileFormView(user: $user, formIsVisible: $formIsVisible)
}
