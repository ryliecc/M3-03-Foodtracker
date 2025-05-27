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
            Text(entry.formattedDate)
        }
    }
}

#Preview {
    var entry = Entry(title: "Titel", date: Date(), calories: 100, type: .meal)
    EntryDetailsView(entry: entry)
}
