//
//  ProfileFormView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct ProfileFormView: View {
    @AppStorage("username") private var username: String = "Gast"
    @AppStorage("sex") private var sex: String = "male"
    @AppStorage("height") private var height: Double = 1.60
    @AppStorage("weight") private var weight: Double = 50.0
    @AppStorage("weightgoal") private var weightGoal: String = "Gewicht halten"
    @AppStorage("activityLevel") private var activityLevel: String = "mäßig aktiv"
    @AppStorage("caloriegoal") private var calorieGoal: Int = 2000
    @AppStorage("diet") private var diet: String = "Omnivor"
    @AppStorage("carbgoal") private var carbohydrateGoal: Double = 200.0
    @AppStorage("proteingoal") private var proteinGoal: Double = 100.0
    @AppStorage("fatgoal") private var fatGoal: Double = 50.0
    @State var newUserName: String = ""
    @State var newUserSex: Sex = .male
    @State var newUserHeight: Double = 1.40
    @State var newUserWeight: Double = 30.0
    @State var newUserWeightGoal: WeightGoal = .maintain
    @State var newUserActivityLevel: ActivityLevel = .medium
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
    @State var newUserDiet: Diet = .omnivore
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
                        username = newUserName
                        sex = newUserSex.rawValue
                        height = newUserHeight
                        weight = newUserWeight
                        weightGoal = newUserWeightGoal.rawValue
                        activityLevel = newUserActivityLevel.rawValue
                        calorieGoal = newUserCalorieGoal
                        diet = newUserDiet.rawValue
                        carbohydrateGoal = newUserCarbohydrateGoal
                        proteinGoal = newUserProteinGoal
                        fatGoal = newUserFatGoal
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
        .onAppear {
            if newUserName == "" && newUserHeight == 1.40 && newUserWeight == 30.0 {
                newUserName = username
                newUserSex = Sex(rawValue: sex)!
                newUserHeight = height
                newUserWeight = weight
                newUserWeightGoal = WeightGoal(rawValue: weightGoal)!
                newUserActivityLevel = ActivityLevel(rawValue: activityLevel)!
                newUserDiet = Diet(rawValue: diet)!
            }
        }
    }
}

#Preview {
    @Previewable @State var formIsVisible: Bool = true
    ProfileFormView(formIsVisible: $formIsVisible)
}
