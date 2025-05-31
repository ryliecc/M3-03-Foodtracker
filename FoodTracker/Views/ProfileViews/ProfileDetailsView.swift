//
//  ProfileDetailsView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct ProfileDetailsView: View {
    @Binding var user: User
    @Binding var formIsVisible: Bool
    var body: some View {
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 8).fill(Color("SecondaryColor"))
                    .frame(width: 360, height: 440)
                    .position(x: 200, y: 260)
                RoundedRectangle(cornerRadius: 8).fill(.white)
                    .frame(width: 320, height: 380)
                    .padding(.bottom, 30)
                    .position(x: 200, y: 264)
                RoundedRectangle(cornerRadius: 8).fill(.brown)
                    .frame(width: 200, height: 60)
                    .position(x: 200, y: 48)
                VStack {
                    Text("Name: \(user.name)")
                    Text(
                        "Dominierende Hormone: \(user.sex == .male ? "Testosteron" : "Östrogen")"
                    )
                    Text("Größe: \(user.heightInMeter.formattedMeters)")
                    Text("Gewicht: \(user.weightInKilogram.formattedKilograms)")
                    Text(
                        "BMI: \(String(format: "%.1f", user.bmi)) (\(user.weightCategory.rawValue))"
                    )
                    Text("Aktivitätslevel: \(user.activityLevel.rawValue)")
                    Text("Kalorienziel: \(user.calorieGoal) kcal")
                    Text("Ziel: \(user.weightGoal.rawValue)")
                    Text("Ernährungsform: \(user.diet.rawValue)")
                    Text(
                        "Kohlenhydrate: \(user.carbohydrateInGramGoal.formattedGrams)"
                    )
                    Text("Protein: \(user.proteinInGramGoal.formattedGrams)")
                    Text("Fett: \(user.fatInGramGoal.formattedGrams)")
                    Button("Bearbeiten") {
                        formIsVisible = true
                    }
                }
                .position(x: 200, y: 260)
            }
        }
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
    @Previewable @State var formIsVisible: Bool = false
    ProfileDetailsView(user: $user, formIsVisible: $formIsVisible)
}
