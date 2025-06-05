//
//  FavoritesView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftData
import SwiftUI

struct FavoritesView: View {
    @Query(
        filter: #Predicate<Entry> { entry in
            entry.isFavorite
        }
    ) var entries: [Entry]
    var favoritesDictionary: [String: Entry] {
        var dictionary: [String: Entry] = [:]
        for entry in entries where entry.isFavorite {
            dictionary[entry.title] = entry
        }
        return dictionary
    }
    var favoriteEntries: [Entry] {
        Array(favoritesDictionary.values)
    }
    var filteredEntries: [Entry] {
        favoriteEntries.filter { $0.type == allEntryTypes[chosenIndex] }
    }
    let allEntryTypes: [EntryType] = EntryType.allCases
    @State var chosenIndex: Int = 0
    let maxIndex = EntryType.allCases.count - 1
    @State var sheetIsVisible = false
    @State var newEntry: Entry = Entry(
        title: "",
        date: Date(),
        calories: 0,
        carbohydrates: 0,
        protein: 0,
        fat: 0,
        type: .breakfast
    )

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        if chosenIndex == 0 {
                            chosenIndex = maxIndex
                        } else {
                            chosenIndex -= 1
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text(allEntryTypes[chosenIndex].rawValue)
                    Spacer()
                    Button(action: {
                        if chosenIndex == maxIndex {
                            chosenIndex = 0
                        } else {
                            chosenIndex += 1
                        }
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                if filteredEntries.count > 0 {
                    List {
                        ForEach(filteredEntries, id: \.id) { entry in
                            FavoritesListItemView(entry: entry)
                                .swipeActions {
                                    Button {
                                        newEntry = Entry(
                                            title: entry.title,
                                            date: Date(),
                                            calories: entry.calories,
                                            carbohydrates: entry.carbohydrates,
                                            protein: entry.protein,
                                            fat: entry.fat,
                                            type: entry.type,
                                            isFavorite: entry.isFavorite
                                        )
                                        sheetIsVisible = true
                                    } label: {
                                        Label(
                                            "Neuer Eintrag",
                                            systemImage: "plus.app"
                                        )
                                    }
                                }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                } else {
                    Spacer()
                    Text("Noch keine Einträge ...")
                    Spacer()
                }
            }
            .sheet(isPresented: $sheetIsVisible) {
                EntryFormSheetView(
                    sheetIsVisible: $sheetIsVisible,
                    newEntryTitle: $newEntry.title,
                    newEntryDate: $newEntry.date,
                    newEntryCalories: $newEntry.calories,
                    newEntryCarbohydrates: $newEntry.carbohydrates,
                    newEntryProtein: $newEntry.protein,
                    newEntryFat: $newEntry.fat,
                    newEntryType: $newEntry.type,
                    newEntryIsFavorite: $newEntry.isFavorite
                )
            }
        }
    }
}

#Preview {
    FavoritesView()
}
