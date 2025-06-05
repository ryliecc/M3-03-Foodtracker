//
//  FavoritesListItemView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct FavoritesListItemView: View {
    var entry: Entry
    var body: some View {
        NavigationLink(destination: EntryDetailsView(entry: entry)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(entry.title)
                        .font(Fonts.entryTitle)
                    Spacer()
                    Text("Kohlenhydrate: \(entry.carbohydrates.formattedGrams)")
                        .font(Fonts.entryDate)
                    Text("Protein: \(entry.protein.formattedGrams)")
                        .font(Fonts.entryDate)
                    Text("Fett: \(entry.fat.formattedGrams)")
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
                .foregroundColor(Color("SecondaryColor"))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(
                        Color(Color("PrimaryColor"))
                    )
                )
            }
            .frame(height: 72)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(
                    Color("SecondaryColor")
                )
            )
        }
    }
}

#Preview {
    let entry = Entry(
        title: "Titel",
        date: Date(),
        calories: 100,
        carbohydrates: 20,
        protein: 20,
        fat: 10,
        type: .breakfast,
        isFavorite: true
    )
    FavoritesListItemView(entry: entry)
}
