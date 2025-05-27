//
//  EntryListHeaderView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntryListHeaderView: View {
    @State var alertIsVisible: Bool = false
    @Binding var entries: [Entry]
    var body: some View {
        HStack {
            Text("Einträge")
                .font(Fonts.listTitle)
            Spacer()
            Button("Alles löschen") {
                alertIsVisible = true
            }
            .foregroundColor(.red)
            .alert("Bist du sicher, dass du alle Einträge löschen willst?", isPresented: $alertIsVisible) {
                Button("Abbrechen", role: .cancel) { }
                Button("Löschen", role: .destructive) {
                    entries.removeAll()
                }
            }
        }
        .listRowSeparator(.hidden)
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
    EntryListHeaderView(entries: $entries)
}
