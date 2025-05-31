//
//  DashboardView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 29.05.25.
//

import SwiftUI

struct DashboardView: View {
    @Binding var entries: [Entry]
    @Binding var user: User

    var calorieSum: Int {
        var sum = 0
        entries.filter { entry in
            Calendar.current.isDate(entry.date, inSameDayAs: Date())
        }.forEach { entry in
            sum += entry.calories
        }
        return sum
    }
    var carbohydrateSum: Double {
        var sum = 0.0
        entries.filter { entry in
            Calendar.current.isDate(entry.date, inSameDayAs: Date())
        }.forEach { entry in
            sum += entry.carbohydrates
        }
        return sum
    }
    var proteinSum: Double {
        var sum = 0.0
        entries.filter { entry in
            Calendar.current.isDate(entry.date, inSameDayAs: Date())
        }.forEach { entry in
            sum += entry.protein
        }
        return sum
    }
    var fatSum: Double {
        var sum = 0.0
        entries.filter { entry in
            Calendar.current.isDate(entry.date, inSameDayAs: Date())
        }.forEach { entry in
            sum += entry.fat
        }
        return sum
    }

    var calorieprogress: Double {
        1.0 / Double(user.calorieGoal) * Double(calorieSum)
    }
    var carbohydrateProgress: Double {
        1.0 / user.carbohydrateInGramGoal * carbohydrateSum
    }
    var proteinProgress: Double {
        1.0 / user.proteinInGramGoal * proteinSum
    }
    var fatProgress: Double {
        1.0 / user.fatInGramGoal * fatSum
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("\(greeting()), \(user.name)!")
                    .font(Fonts.dashboardGreeting)
                    .position(x: 120, y: 32)
                CircularCalorieProgressView(
                    progress: calorieprogress,
                    centerText: "\(calorieSum.formatted())\nkcal"
                )
                .position(x: 200, y: 200)
                AllMacrosProgressView(
                    carbohydrateProgress: carbohydrateProgress,
                    carbohydrateSum: carbohydrateSum,
                    proteinProgress: proteinProgress,
                    proteinSum: proteinSum,
                    fatProgress: fatProgress,
                    fatSum: fatSum
                )
                .position(x: 200, y: 200)
                Spacer()
                    .padding(.bottom, 100)
            }
        }
    }

    func greeting(for date: Date = Date()) -> String {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 5..<12:
            return "Guten Morgen"
        case 12..<18:
            return "Guten Tag"
        case 18..<22:
            return "Guten Abend"
        default:
            return "Gute Nacht"
        }
    }
}

#Preview {
    @Previewable @State var entries: [Entry] = [
        Entry(
            title: "Frühlingsrolle",
            date: Date(),
            calories: 154,
            carbohydrates: 16.9,
            protein: 3.6,
            fat: 5.7,
            type: .snack
        ),
        Entry(
            title: "Veganer Chicken Burger",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 473,
            carbohydrates: 30,
            protein: 5.2,
            fat: 15,
            type: .lunch
        ),
        Entry(
            title: "Rührtofu",
            date: Date(),
            calories: 435,
            carbohydrates: 4,
            protein: 23.6,
            fat: 35.3,
            type: .breakfast
        ),
        Entry(
            title: "Pasta al Pesto",
            date: Date(),
            calories: 236,
            carbohydrates: 12,
            protein: 5.8,
            fat: 4.6,
            type: .lunch
        ),
        Entry(
            title: "Club Mate",
            date: Date(),
            calories: 140,
            carbohydrates: 35,
            protein: 0,
            fat: 0,
            type: .drink
        ),
        Entry(
            title: "Laugenbrezel",
            date: Date(),
            calories: 269,
            carbohydrates: 52,
            protein: 9.8,
            fat: 3.2,
            type: .snack
        ),
        Entry(
            title: "Wasser",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 0,
            carbohydrates: 0,
            protein: 0,
            fat: 0,
            type: .drink
        ),
        Entry(
            title: "Studentenfutter",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 462,
            carbohydrates: 44.9,
            protein: 13.8,
            fat: 29.4,
            type: .snack
        ),
    ]
    @Previewable @State var user: User = User(
        name: "Rylie",
        sex: .male,
        heightInMeter: 1.46,
        weightInKilogram: 63.2,
        activityLevel: .medium,
        weightGoal: .lose,
        diet: .veganRegular
    )
    DashboardView(entries: $entries, user: $user)
}
