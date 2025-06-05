//
//  ProfileDetailsView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct ProfileDetailsView: View {
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
                        secondText: username
                    )
                    ProfileDetailsRowView(
                        firstText: "Dominierende Hormone:",
                        secondText: (sex == "male"
                            ? "Testosteron" : "Östrogen")
                    )
                    ProfileDetailsRowView(
                        firstText: "Größe:",
                        secondText: height.formattedMeters
                    )
                    ProfileDetailsRowView(
                        firstText: "Gewicht:",
                        secondText: weight.formattedKilograms
                    )
                    Divider()
                    ProfileDetailsRowView(
                        firstText: "Aktivitätslevel:",
                        secondText: activityLevel
                    )
                    ProfileDetailsRowView(
                        firstText: "Kalorienziel:",
                        secondText: "\(calorieGoal.formatted()) kcal"
                    )
                    .foregroundColor(Color("PrimaryColor"))
                    ProfileDetailsRowView(
                        firstText: "Ziel:",
                        secondText: weightGoal
                    )
                    Divider()
                    ProfileDetailsRowView(
                        firstText: "Ernährungsform:",
                        secondText: diet
                    )
                    ProfileDetailsRowView(
                        firstText: "Kohlenhydrate:",
                        secondText: carbohydrateGoal.formattedGrams
                    )
                    .foregroundColor(Color("CarbohydratePrimaryColor"))
                    ProfileDetailsRowView(
                        firstText: "Protein",
                        secondText: proteinGoal.formattedGrams
                    )
                    .foregroundColor(Color("ProteinPrimaryColor"))
                    ProfileDetailsRowView(
                        firstText: "Fett:",
                        secondText: fatGoal.formattedGrams
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
    @Previewable @State var formIsVisible: Bool = false
    ProfileDetailsView(formIsVisible: $formIsVisible)
}
