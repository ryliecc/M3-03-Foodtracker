//
//  DashboardView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 29.05.25.
//

import SwiftUI

struct DashboardView: View {
    @Binding var entries: [Entry]

    var calorieSum: Int {
        var sum = 0
        entries.forEach { entry in
            sum += entry.calories
        }
        return sum
    }

    var body: some View {
        Text("Guten Abend!")
        Spacer()
        VStack {
            Text("Du hast heute")
            Text("\(calorieSum) kcal")
            Text("zu dir genommen.")
        }
        Spacer()
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
            date: Date(),
            calories: 473,
            carbohydrates: 30,
            protein: 5.2,
            fat: 15,
            type: .meal
        ),
        Entry(
            title: "Rührtofu",
            date: Date(),
            calories: 435,
            carbohydrates: 4,
            protein: 23.6,
            fat: 35.3,
            type: .meal
        ),
        Entry(
            title: "Pasta al Pesto",
            date: Date(),
            calories: 236,
            carbohydrates: 12,
            protein: 5.8,
            fat: 4.6,
            type: .meal
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
            date: Date(),
            calories: 0,
            carbohydrates: 0,
            protein: 0,
            fat: 0,
            type: .drink
        ),
        Entry(
            title: "Studentenfutter",
            date: Date(),
            calories: 462,
            carbohydrates: 44.9,
            protein: 13.8,
            fat: 29.4,
            type: .snack
        ),
    ]
    DashboardView(entries: $entries)
}
