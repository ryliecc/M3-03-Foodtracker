//
//  ContentView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct ContentView: View {
    @State var user: User = User(name: "Rylie", sex: .male, heightInMeter: 1.64, weightInKilogram: 63.5, activityLevel: .low, weightGoal: .maintain, calorieGoal: 2095, diet: .veganRegular, carbohydrateInGramGoal: 261.9, proteinInGramGoal: 130.9, fatInGramGoal: 58.2)
    @State private var selection: ViewSelection = .dashboard
    @State var entries: [Entry] = [
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
            type: .breakfast,
            isFavorite: true
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
            type: .drink,
            isFavorite: true
        ),
        Entry(
            title: "Laugenbrezel",
            date: Date(),
            calories: 269,
            carbohydrates: 52,
            protein: 9.8,
            fat: 3.2,
            type: .snack,
            isFavorite: true
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
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            TabView(selection: $selection) {
                Tab("Dashboard", systemImage: "house.fill", value: .dashboard) {
                    DashboardView(entries: $entries, user: $user)
                }
                Tab("Einträge", systemImage: "list.bullet", value: .entryList) {
                    EntryListView(entries: $entries)
                }
                Tab("Favoriten", systemImage: "suit.heart.fill", value: .favorites) {
                    FavoritesView(entries: $entries)
                }
                Tab("Profil", systemImage: "person.crop.circle.fill", value: .profile) {
                    ProfileView(user: $user)
                }
            }
            .accentColor(Color("PrimaryColor"))
        }
    }
}

#Preview {
    ContentView()
}
