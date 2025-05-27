//
//  EntrySectionView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntrySectionView: View {
    var sectionTitle: String
    var sectionEntries: [Entry]
    @Binding var allEntries: [Entry]

    var body: some View {
        Section(sectionTitle.uppercased()) {
            ForEach(sectionEntries, id: \.id) { entry in
                EntryListItem(entry: entry)
                    .swipeActions {
                        Button(role: .destructive) {
                            if let index = allEntries.firstIndex(where: {
                                $0.id == entry.id
                            }) {
                                allEntries.remove(at: index)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var entries: [Entry] = [
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
    var sectionEntries: [Entry] { entries.filter { $0.type == .meal } }
    EntrySectionView(
        sectionTitle: "Mahlzeiten",
        sectionEntries: sectionEntries,
        allEntries: $entries
    )
}
