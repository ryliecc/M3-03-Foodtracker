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
    var body: some View {
        if formIsVisible {
            Form {
                Section("Name") {
                    TextField("Name", text: $newUser.name)
                }
                Section("Kalorienziel") {
                    
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
            Text("Dominierende Hormone: \(user.sex == .male ? "Testosteron" : "Östrogen")")
            Text("Größe: \(user.heightInMeter.formattedMeters)")
            Text("Gewicht: \(user.weightInKilogram.formattedKilograms)")
            Text("Aktivitätslevel: \(user.activityLevel.rawValue)")
            Text("Kalorienziel: \(user.calorieGoal) kcal")
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
        self.newUser = User(name: user.wrappedValue.name, sex: user.wrappedValue.sex, heightInMeter: user.wrappedValue.heightInMeter, weightInKilogram: user.wrappedValue.weightInKilogram, activityLevel: user.wrappedValue.activityLevel, weightGoal: user.wrappedValue.weightGoal, diet: user.wrappedValue.diet)
    }
}

#Preview {
    @Previewable @State var user: User = User(name: "Rylie", sex: .male, heightInMeter: 1.63, weightInKilogram: 63.2, activityLevel: .medium, weightGoal: .maintain, diet: .veganRegular)
    ProfileView(user: $user)
}
