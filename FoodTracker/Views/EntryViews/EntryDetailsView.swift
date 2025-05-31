//
//  EntryDetailsView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntryDetailsView: View {
    var entry: Entry
    var body: some View {
        VStack {
            Text(entry.title)
            Text(entry.type.rawValue)
            Text("\(entry.calories) kcal")
            Text("\(entry.carbohydrates.formattedGrams) Kohlenhydrate")
            Text("\(entry.protein.formattedGrams) Protein")
            Text("\(entry.fat.formattedGrams) Fett")
            Text(entry.formattedDate)
        }
        .navigationTitle(entry.title)
    }
}

#Preview {
    var entry = Entry(
        title: "Titel",
        date: Date(),
        calories: 100,
        carbohydrates: 20,
        protein: 20,
        fat: 10,
        type: .meal
    )
    EntryDetailsView(entry: entry)
}
