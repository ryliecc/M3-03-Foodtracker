//
//  DashboardView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 29.05.25.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query var entries: [Entry]
    @AppStorage("username") private var username: String = "Gast"
    @AppStorage("caloriegoal") private var calorieGoal: Int = 2000
    @AppStorage("carbgoal") private var carbohydrateGoal: Double = 200.0
    @AppStorage("proteingoal") private var proteinGoal: Double = 100.0
    @AppStorage("fatgoal") private var fatGoal: Double = 50.0

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
        1.0 / Double(calorieGoal) * Double(calorieSum)
    }
    var carbohydrateProgress: Double {
        1.0 / carbohydrateGoal * carbohydrateSum
    }
    var proteinProgress: Double {
        1.0 / proteinGoal * proteinSum
    }
    var fatProgress: Double {
        1.0 / fatGoal * fatSum
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("\(greeting()), \(username)!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Fonts.dashboardGreeting)
                    .position(x: 230, y: 32)
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
    DashboardView()
}
