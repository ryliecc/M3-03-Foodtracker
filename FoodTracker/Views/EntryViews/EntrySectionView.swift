//
//  EntrySectionView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI
import SwiftData

struct EntrySectionView: View {
    @Environment(\.modelContext) var context
    var sectionTitle: String
    var sectionEntries: [Entry]
    @Query var allEntries: [Entry]

    var body: some View {
        Section(sectionTitle.uppercased()) {
            ForEach(sectionEntries, id: \.id) { entry in
                EntryListItem(entry: entry)
                    .listRowSeparator(.hidden)
                    .swipeActions {
                        Button(role: .destructive) {
                            context.delete(entry)
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                        Button {
                            entry.isFavorite.toggle()
                        } label: {
                            Label(
                                (entry.isFavorite ? "Entfavorisieren" : "Favorisieren"),
                                systemImage: "suit.heart"
                            )
                        }
                    }
            }
        }
    }
}

#Preview {
    var sectionEntries: [Entry] = [
        Entry(
            title: "Rührtofu",
            date: Date(),
            calories: 435,
            carbohydrates: 4,
            protein: 23.6,
            fat: 35.3,
            type: .breakfast
        )
    ]
    EntrySectionView(
        sectionTitle: "Frühstück",
        sectionEntries: sectionEntries
    )
}
