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
                    .frame(width: 360, height: 600)
                    .position(x: 200, y: 330)
                RoundedRectangle(cornerRadius: 8).fill(.white)
                    .frame(width: 320, height: 560)
                    .padding(.bottom, 30)
                    .position(x: 200, y: 340)
                RoundedRectangle(cornerRadius: 8).fill(.brown)
                    .frame(width: 200, height: 60)
                    .position(x: 200, y: 48)
                Grid(alignment: .top) {
                    ProfileDetailsRowView(
                        firstText: "Name:",
                        secondText: user.name
                    )
                    ProfileDetailsRowView(
                        firstText: "Dominierende Hormone:",
                        secondText: (user.sex == .male
                            ? "Testosteron" : "Östrogen")
                    )
                    ProfileDetailsRowView(
                        firstText: "Größe:",
                        secondText: user.heightInMeter.formattedMeters
                    )
                    ProfileDetailsRowView(
                        firstText: "Gewicht:",
                        secondText: user.weightInKilogram.formattedKilograms
                    )
                    Divider()
                    ProfileDetailsRowView(
                        firstText: "BMI:",
                        secondText:
                            "\(String(format: "%.1f", user.bmi)) (\(user.weightCategory.rawValue))"
                    )
                    ProfileDetailsRowView(
                        firstText: "Aktivitätslevel:",
                        secondText: user.activityLevel.rawValue
                    )
                    ProfileDetailsRowView(
                        firstText: "Kalorienziel:",
                        secondText: "\(user.calorieGoal) kcal"
                    )
                    .foregroundColor(Color("PrimaryColor"))
                    ProfileDetailsRowView(
                        firstText: "Ziel:",
                        secondText: user.weightGoal.rawValue
                    )
                    Divider()
                    ProfileDetailsRowView(
                        firstText: "Ernährungsform:",
                        secondText: user.diet.rawValue
                    )
                    ProfileDetailsRowView(
                        firstText: "Kohlenhydrate:",
                        secondText: user.carbohydrateInGramGoal.formattedGrams
                    )
                    .foregroundColor(Color("CarbohydratePrimaryColor"))
                    ProfileDetailsRowView(
                        firstText: "Protein",
                        secondText: user.proteinInGramGoal.formattedGrams
                    )
                    .foregroundColor(Color("ProteinPrimaryColor"))
                    ProfileDetailsRowView(
                        firstText: "Fett:",
                        secondText: user.fatInGramGoal.formattedGrams
                    )
                    .foregroundColor(Color("FatPrimaryColor"))
                    .padding(.bottom, 40)
                    Button("Bearbeiten") {
                        formIsVisible = true
                    }
                    .foregroundColor(Color("SecondaryColor"))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(
                            Color("PrimaryColor")
                        )
                    )

                }
                .frame(width: 300)
                .position(x: 210, y: 340)

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
