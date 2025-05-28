//
//  EntryListItem.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntryListItem: View {
    var entry: Entry

    var body: some View {
        NavigationLink(destination: EntryDetailsView(entry: entry)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(entry.title)
                        .font(Fonts.entryTitle)
                    Spacer()
                    Text("\(entry.formattedDate)")
                        .font(Fonts.entryDate)
                }
                Spacer()
                VStack {
                    Text("\(entry.calories)")
                        .font(Fonts.entryCalories)
                    Text("kcal")
                        .font(Fonts.entryCaloriesLabel)
                }
                .frame(width: 48, height: 48)
                .foregroundColor(
                    Color(red: 216 / 255, green: 224 / 255, blue: 172 / 255)
                )
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(
                        Color(
                            red: 99 / 255,
                            green: 105 / 255,
                            blue: 64 / 255
                        )
                    )
                )
            }
            .frame(height: 72)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(
                    Color(red: 216 / 255, green: 224 / 255, blue: 172 / 255)
                )
            )
        }
        .buttonStyle(PlainButtonStyle())
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
    EntryListItem(entry: entry)
}
