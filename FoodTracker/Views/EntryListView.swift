//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 26.05.25.
//

import SwiftUI

struct EntryListView: View {
    @State var entries: [Entry] = [
        Entry(title: "Frühlingsrolle", date: Date(), calories: 154),
        Entry(title: "Veganer Chicken Burger", date: Date(), calories: 473),
        Entry(title: "Rührtofu", date: Date(), calories: 435),
        Entry(title: "Pasta al Pesto", date: Date(), calories: 236),
    ]

    var body: some View {
        List {
            ForEach(entries, id: \.id) { entry in
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
                    .foregroundColor(Color(red: 216 / 255, green: 224 / 255, blue: 172 / 255))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 99 / 255, green: 105 / 255, blue: 64 / 255)))
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 216 / 255, green: 224 / 255, blue: 172 / 255)))
            }
            .onDelete(perform: delete)
        }
        .listStyle(.plain)
    }
    
    func delete(at offsets: IndexSet) {
            entries.remove(atOffsets: offsets)
        }
}



#Preview {
    EntryListView()
}
