//
//  ProfileView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: User
    @State var newUser: User
    @State var formIsVisible: Bool = false
    
    var weightRange: [Double] {
        Array(stride(from: 30.0, through: 200.0, by: 0.1))
    }
    var heightRange: [Double] {
        Array(stride(from: 1.40, through: 2.20, by: 0.01))
    }
    
    var body: some View {
        if formIsVisible {
            Form {
                Section("Name") {
                    TextField("Name", text: $newUser.name)
                }
                Section("Dominierende Hormone") {
                    Picker("Geschlecht wählen:", selection: $newUser.sex) {
                        Text("Testosteron").tag(Sex.male)
                        Text("Östrogen").tag(Sex.female)
                    }
                    .pickerStyle(.palette)
                }
                Section("Körpergewicht") {
                    Picker("Gewicht", selection: $newUser.weightInKilogram) {
                        ForEach(weightRange, id: \.self) { weight in
                            Text(String(format: "%.1f kg", weight)).tag(weight)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 100)
                    .clipped()
                }
                Section("Körpergröße") {
                    Picker("Größe", selection: $newUser.heightInMeter) {
                        ForEach(heightRange, id: \.self) { height in
                            Text(String(format: "%.2f m", height)).tag(height)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 100)
                    .clipped()
                }
                Section("BMI") {
                    Text("BMI: \(String(format: "%.1f", newUser.bmi)) (\(newUser.weightCategory.rawValue))")
                    Picker("Ziel wählen:", selection: $newUser.weightGoal) {
                        ForEach(WeightGoal.allCases, id: \.self) { goal in
                            Text(goal.rawValue).tag(goal)
                        }
                    }
                }
                Section("Aktivitätslevel") {
                    Picker("Level wählen", selection: $newUser.activityLevel) {
                        ForEach(ActivityLevel.allCases, id: \.rawValue) {
                            level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                }
                Section("Ernährungsform") {
                    Picker("Ernährung wählen", selection: $newUser.diet) {
                        ForEach(Diet.allCases, id: \.rawValue) {
                            diet in
                            Text(diet.rawValue).tag(diet)
                        }
                    }
                }
                Section("Ernährungsziele") {
                    Text("Kalorien: \(newUser.calorieGoal) kcal")
                    Text("Kohlenhydrate: \(newUser.carbohydrateInGramGoal.formattedGrams)")
                    Text("Protein: \(newUser.proteinInGramGoal.formattedGrams)")
                    Text("Fett: \(newUser.fatInGramGoal.formattedGrams)")
                }
                Section {
                    HStack {
                        Button("Abbrechen") {
                            newUser = user
                            formIsVisible = false
                        }
                        Spacer()
                        Button("Speichern") {
                            user = newUser
                            formIsVisible = false
                        }
                    }
                }
            }
        } else {
            Text("Name: \(user.name)")
            Text(
                "Dominierende Hormone: \(user.sex == .male ? "Testosteron" : "Östrogen")"
            )
            Text("Größe: \(user.heightInMeter.formattedMeters)")
            Text("Gewicht: \(user.weightInKilogram.formattedKilograms)")
            Text("BMI: \(String(format: "%.1f", user.bmi)) (\(user.weightCategory.rawValue))")
            Text("Aktivitätslevel: \(user.activityLevel.rawValue)")
            Text("Kalorienziel: \(user.calorieGoal) kcal")
            Text("Ziel: \(user.weightGoal.rawValue)")
            Text("Ernährungsform: \(user.diet.rawValue)")
            Text("Kohlenhydrate: \(user.carbohydrateInGramGoal.formattedGrams)")
            Text("Protein: \(user.proteinInGramGoal.formattedGrams)")
            Text("Fett: \(user.fatInGramGoal.formattedGrams)")
            Button("Bearbeiten") {
                formIsVisible = true
            }
        }
    }

    init(user: Binding<User>) {
        self._user = user
        self.newUser = User(
            name: user.wrappedValue.name,
            sex: user.wrappedValue.sex,
            heightInMeter: (user.wrappedValue.heightInMeter * 100).rounded() / 100,
            weightInKilogram: Double(round(2 * user.wrappedValue.weightInKilogram) / 2),
            activityLevel: user.wrappedValue.activityLevel,
            weightGoal: user.wrappedValue.weightGoal,
            diet: user.wrappedValue.diet
        )
    }
}

#Preview {
    @Previewable @State var user: User = User(
        name: "Rylie",
        sex: .male,
        heightInMeter: 1.64,
        weightInKilogram: 63.2,
        activityLevel: .low,
        weightGoal: .maintain,
        diet: .veganRegular
    )
    ProfileView(user: $user)
}
