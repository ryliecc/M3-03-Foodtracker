//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 26.05.25.
//

import SwiftUI
import SwiftData

struct EntryListView: View {
    @Query var entries: [Entry]
    @State private var selectedDate: Date = Calendar.current.startOfDay(
        for: Date()
    )

    var filteredEntries: [Entry] {
        entries.filter {
            Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
        }
    }

    var breakfasts: [Entry] { filteredEntries.filter { $0.type == .breakfast } }
    var lunches: [Entry] { filteredEntries.filter { $0.type == .lunch } }
    var dinners: [Entry] { filteredEntries.filter { $0.type == .dinner } }
    var drinks: [Entry] { filteredEntries.filter { $0.type == .drink } }
    var snacks: [Entry] { filteredEntries.filter { $0.type == .snack } }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack {
                        Button(action: {
                            if let previousDay = Calendar.current.date(
                                byAdding: .day,
                                value: -1,
                                to: selectedDate
                            ) {
                                selectedDate = previousDay
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Text(
                            Calendar.current.isDate(
                                selectedDate,
                                inSameDayAs: Date()
                            )
                                ? "Heute"
                                : selectedDate.formatted(
                                    date: .abbreviated,
                                    time: .omitted
                                )
                        )
                        .font(.headline)
                        Spacer()
                        Button(action: {
                            if let nextDay = Calendar.current.date(
                                byAdding: .day,
                                value: 1,
                                to: selectedDate
                            ) {
                                selectedDate = nextDay
                            }
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    if (breakfasts.count + lunches.count + dinners.count + drinks.count + snacks.count) > 0 {
                        List {
                            EntryListHeaderView(
                                selectedDate: $selectedDate
                            )
                            if breakfasts.count > 0 {
                                EntrySectionView(
                                    sectionTitle: "Frühstück",
                                    sectionEntries: breakfasts
                                )
                            }
                            if lunches.count > 0 {
                                EntrySectionView(
                                    sectionTitle: "Mittagessen",
                                    sectionEntries: lunches
                                )
                            }
                            if dinners.count > 0 {
                                EntrySectionView(
                                    sectionTitle: "Abendessen",
                                    sectionEntries: dinners
                                )
                            }
                            if drinks.count > 0 {
                                EntrySectionView(
                                    sectionTitle: "Getränke",
                                    sectionEntries: drinks
                                )
                            }
                            if snacks.count > 0 {
                                EntrySectionView(
                                    sectionTitle: "Snacks",
                                    sectionEntries: snacks
                                )
                            }
                            Spacer()
                                .padding(.bottom, 32)
                                .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                    } else {
                        Spacer()
                        Text("Noch keine Einträge ...")
                        Spacer()
                    }
                }
                EntryFormView()
                    .padding()
                    .padding(.bottom, -8)
            }
        }
    }
}

#Preview {
    EntryListView()
}
