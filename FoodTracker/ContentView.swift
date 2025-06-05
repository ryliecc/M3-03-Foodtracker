//
//  ContentView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selection: ViewSelection = .dashboard
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            TabView(selection: $selection) {
                Tab("Dashboard", systemImage: "house.fill", value: .dashboard) {
                    DashboardView()
                }
                Tab("Einträge", systemImage: "list.bullet", value: .entryList) {
                    EntryListView()
                }
                Tab(
                    "Favoriten",
                    systemImage: "suit.heart.fill",
                    value: .favorites
                ) {
                    FavoritesView()
                }
                Tab(
                    "Profil",
                    systemImage: "person.crop.circle.fill",
                    value: .profile
                ) {
                    ProfileView()
                }

            }
            .accentColor(Color("PrimaryColor"))
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Entry.self, inMemory: true)
}
