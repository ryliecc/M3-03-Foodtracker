//
//  FavoritesView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var entries: [Entry]
    var filteredEntries: [Entry] {
        entries.filter { $0.isFavorite }.filter { $0.type == allEntryTypes[chosenIndex] }
    }
    let allEntryTypes: [EntryType] = EntryType.allCases
    @State var chosenIndex: Int = 0
    let maxIndex = EntryType.allCases.count - 1
    @State var sheetIsVisible = false
    @State var newEntry: Entry = Entry(title: "", date: Date(), calories: 0, carbohydrates: 0, protein: 0, fat: 0, type: .breakfast)
    
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
                                        newEntry = Entry(title: entry.title, date: Date(), calories: entry.calories, carbohydrates: entry.carbohydrates, protein: entry.protein, fat: entry.fat, type: entry.type, isFavorite: entry.isFavorite)
                                        sheetIsVisible = true
                                    } label: {
                                        Label("Neuer Eintrag", systemImage: "plus.app")
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
                EntryFormSheetView(sheetIsVisible: $sheetIsVisible, newEntryTitle: $newEntry.title, newEntryDate: $newEntry.date, newEntryCalories: $newEntry.calories, newEntryCarbohydrates: $newEntry.carbohydrates, newEntryProtein: $newEntry.protein, newEntryFat: $newEntry.fat, newEntryType: $newEntry.type, newEntryIsFavorite: $newEntry.isFavorite, entries: $entries)
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
            carbohydrates: 16.9,
            protein: 3.6,
            fat: 5.7,
            type: .snack,
            isFavorite: true
        ),
        Entry(
            title: "Veganer Chicken Burger",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 473,
            carbohydrates: 30,
            protein: 5.2,
            fat: 15,
            type: .lunch,
            isFavorite: true
        ),
        Entry(
            title: "Rührtofu",
            date: Date(),
            calories: 435,
            carbohydrates: 4,
            protein: 23.6,
            fat: 35.3,
            type: .breakfast,
            isFavorite: true
        ),
        Entry(
            title: "Pasta al Pesto",
            date: Date(),
            calories: 236,
            carbohydrates: 12,
            protein: 5.8,
            fat: 4.6,
            type: .lunch
        ),
        Entry(
            title: "Club Mate",
            date: Date(),
            calories: 140,
            carbohydrates: 35,
            protein: 0,
            fat: 0,
            type: .drink,
            isFavorite: true
        ),
        Entry(
            title: "Laugenbrezel",
            date: Date(),
            calories: 269,
            carbohydrates: 52,
            protein: 9.8,
            fat: 3.2,
            type: .snack,
            isFavorite: true
        ),
        Entry(
            title: "Wasser",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 0,
            carbohydrates: 0,
            protein: 0,
            fat: 0,
            type: .drink,
            isFavorite: true
        ),
        Entry(
            title: "Studentenfutter",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 462,
            carbohydrates: 44.9,
            protein: 13.8,
            fat: 29.4,
            type: .snack,
            isFavorite: true
        ),
    ]
    FavoritesView(entries: $entries)
}
