//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 26.05.25.
//

import SwiftUI

struct EntryListView: View {
    @State var entries: [Entry] = [
        Entry(
            title: "Frühlingsrolle",
            date: Date(),
            calories: 154,
            type: .snack
        ),
        Entry(
            title: "Veganer Chicken Burger",
            date: Date(),
            calories: 473,
            type: .meal
        ),
        Entry(title: "Rührtofu", date: Date(), calories: 435, type: .meal),
        Entry(
            title: "Pasta al Pesto",
            date: Date(),
            calories: 236,
            type: .meal
        ),
        Entry(title: "Club Mate", date: Date(), calories: 140, type: .drink),
        Entry(title: "Laugenbrezel", date: Date(), calories: 269, type: .snack),
        Entry(title: "Wasser", date: Date(), calories: 0, type: .drink),
        Entry(
            title: "Studentenfutter",
            date: Date(),
            calories: 462,
            type: .snack
        ),
    ]

    var meals: [Entry] { entries.filter { $0.type == .meal } }
    var drinks: [Entry] { entries.filter { $0.type == .drink } }
    var snacks: [Entry] { entries.filter { $0.type == .snack } }

    var body: some View {
        List {
            EntryListHeaderView(entries: $entries)
            EntrySectionView(
                sectionTitle: "Mahlzeiten",
                sectionEntries: meals,
                allEntries: $entries
            )
            EntrySectionView(
                sectionTitle: "Getränke",
                sectionEntries: drinks,
                allEntries: $entries
            )
            EntrySectionView(
                sectionTitle: "Snacks",
                sectionEntries: snacks,
                allEntries: $entries
            )
        }
        .listStyle(.plain)
    }
}

#Preview {
    EntryListView()
}
