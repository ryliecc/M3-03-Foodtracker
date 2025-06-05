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
        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("PrimaryColor"))
                    .frame(width: 340, height: 540)
                    .position(x: 184, y: 284)
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .frame(width: 300, height: 490)
                    .position(x: 184, y: 276)
                RoundedRectangle(cornerRadius: 8)
                    .fill(.brown)
                    .frame(width: 200, height: 60)
                    .position(x: 182, y: 30)
                if entry.isFavorite {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("SecondaryColor"))
                        .frame(width: 40, height: 60)
                        .position(x: 60, y: 50)
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 24))
                        .position(x: 60, y: 50)
                        .foregroundColor(.red)
                }
                VStack(alignment: .center) {
                    HStack(alignment: .center) {
                        VStack(alignment: .center) {
                            Text(entry.title)
                                .font(Fonts.entryDetailTitle)
                            Text("\(entry.calories) kcal")
                                .font(Fonts.entryDetailCalories)
                        }
                        .frame(maxWidth: .infinity)
                        Spacer()
                        EntryCategoryView(entryType: entry.type)
                    }
                    VStack(spacing: 12) {
                        Text(
                            "Kohlenhydrate\n\(entry.carbohydrates.formattedGrams)"
                        )
                        .font(Fonts.entryDetailMacros)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("CarbohydratePrimaryColor"))
                        Text("Protein\n\(entry.protein.formattedGrams)")
                            .font(Fonts.entryDetailMacros)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("ProteinPrimaryColor"))
                        Text("Fett\n\(entry.fat.formattedGrams) ")
                            .font(Fonts.entryDetailMacros)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("FatPrimaryColor"))
                    }
                    .padding(.top, 8)
                    Spacer()
                    Text(entry.formattedDate)
                }
                .frame(width: 280, height: 440)
                .position(x: 182, y: 288)
            }
        }
        .padding()
        .navigationTitle(entry.title)
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
    EntryDetailsView(entry: entry)
}
