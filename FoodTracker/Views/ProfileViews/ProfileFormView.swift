//
//  ProfileFormView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct ProfileFormView: View {
    @Binding var user: User
    @State var newUser: User
    @Binding var formIsVisible: Bool

    var weightRange: [Double] {
        Array(stride(from: 30.0, through: 200.0, by: 0.1))
    }
    var heightRange: [Double] {
        Array(stride(from: 1.40, through: 2.20, by: 0.01))
    }

    var body: some View {
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
                Text(
                    "BMI: \(String(format: "%.1f", newUser.bmi)) (\(newUser.weightCategory.rawValue))"
                )
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
                    .foregroundColor(Color("PrimaryColor"))
                    .bold()
                Text(
                    "Kohlenhydrate: \(newUser.carbohydrateInGramGoal.formattedGrams)"
                )
                .foregroundColor(Color("CarbohydratePrimaryColor"))
                .bold()
                Text("Protein: \(newUser.proteinInGramGoal.formattedGrams)")
                    .foregroundColor(Color("ProteinPrimaryColor"))
                    .bold()
                Text("Fett: \(newUser.fatInGramGoal.formattedGrams)")
                    .foregroundColor(Color("FatPrimaryColor"))
                    .bold()
            }
            Section {
                HStack {
                    Button("Abbrechen") {
                        newUser = user
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
                        user = newUser
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
        self.newUser = User(
            name: user.wrappedValue.name,
            sex: user.wrappedValue.sex,
            heightInMeter: (user.wrappedValue.heightInMeter * 100).rounded()
                / 100,
            weightInKilogram: Double(
                round(2 * user.wrappedValue.weightInKilogram) / 2
            ),
            activityLevel: user.wrappedValue.activityLevel,
            weightGoal: user.wrappedValue.weightGoal,
            diet: user.wrappedValue.diet
        )
        self._formIsVisible = formIsVisible
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
    @Previewable @State var formIsVisible: Bool = true
    ProfileFormView(user: $user, formIsVisible: $formIsVisible)
}
