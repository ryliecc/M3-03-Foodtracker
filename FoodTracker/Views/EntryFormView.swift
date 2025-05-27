//
//  EntryFormView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntryFormView: View {
    @State var sheetIsVisible: Bool = false
    @State var newEntryTitle: String = ""
    @State var newEntryCalories: Int = 0
    @State var newEntryType: EntryType = .meal

    @Binding var entries: [Entry]
    var body: some View {
        VStack {
            Button {
                sheetIsVisible = true
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 30))
            }
            .padding()
            .foregroundColor(
                Color(red: 216 / 255, green: 224 / 255, blue: 172 / 255)
            )
            .background(
                Circle().fill(
                    Color(
                        red: 99 / 255,
                        green: 105 / 255,
                        blue: 64 / 255
                    )
                )
            )
            .shadow(radius: 8)
            .sheet(isPresented: $sheetIsVisible) {
                VStack(spacing: 0) {
                    Form {
                        Section {
                            TextField("Titel", text: $newEntryTitle)
                            Stepper(
                                value: $newEntryCalories,
                                in: 0...2000,
                                step: 10
                            ) {
                                Text("\(newEntryCalories) kcal")
                            }
                            Picker(
                                "Kategorie auswählen",
                                selection: $newEntryType
                            ) {
                                ForEach(EntryType.allCases, id: \.rawValue) {
                                    type in
                                    Text(type.rawValue).tag(type)
                                }
                            }
                        }
                        Section {
                            Button("Hinzufügen") {
                                let newEntry = Entry(
                                    title: newEntryTitle,
                                    date: Date(),
                                    calories: newEntryCalories,
                                    type: newEntryType
                                )
                                entries.append(newEntry)
                                newEntryTitle = ""
                                newEntryCalories = 0
                                newEntryType = .meal
                                sheetIsVisible = false
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.yellow))
                            )
                        }
                    }
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                }
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
    EntryFormView(entries: $entries)
}
