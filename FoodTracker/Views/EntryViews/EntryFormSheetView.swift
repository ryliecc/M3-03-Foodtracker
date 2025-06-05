//
//  EntryFormSheetView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI
import SwiftData

struct EntryFormSheetView: View {
    @Environment(\.modelContext) var context
    @Binding var sheetIsVisible: Bool
    @Binding var newEntryTitle: String
    @Binding var newEntryDate: Date
    @Binding var newEntryCalories: Int
    @Binding var newEntryCarbohydrates: Double
    @Binding var newEntryProtein: Double
    @Binding var newEntryFat: Double
    @Binding var newEntryType: EntryType
    @Binding var newEntryIsFavorite: Bool

    var calorieRange: [Int] {
        Array(stride(from: 0, through: 3000, by: 1))
    }
    var macroRange: [Double] {
        Array(stride(from: 0.0, through: 1000, by: 0.1))
    }

    var body: some View {
        VStack(spacing: 0) {
            Form {
                Section {
                    TextField("Titel", text: $newEntryTitle)
                    DatePicker(
                        "Datum auswählen",
                        selection: $newEntryDate,
                        displayedComponents: .date
                    )
                    Picker("Kalorien", selection: $newEntryCalories) {
                        ForEach(calorieRange, id: \.self) { calorie in
                            Text("\(calorie) kcal").tag(calorie)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 80)
                    .clipped()
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
                Section(header: Text("Makronährwerte")) {
                    HStack {
                        Text("Kohlenhydrate:")
                            .font(Fonts.entryTitle)
                            .foregroundColor(Color("CarbohydratePrimaryColor"))
                            .frame(width: 160, alignment: .leading)
                        Picker(
                            "Kohlenhydrate",
                            selection: $newEntryCarbohydrates
                        ) {
                            ForEach(macroRange, id: \.self) { macro in
                                Text(String(format: "%.1f g", macro))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 160, height: 80)
                        .clipped()
                    }
                    HStack {
                        Text("Protein:")
                            .font(Fonts.entryTitle)
                            .foregroundColor(Color("ProteinPrimaryColor"))
                            .frame(width: 160, alignment: .leading)
                        Picker("Protein", selection: $newEntryProtein) {
                            ForEach(macroRange, id: \.self) { macro in
                                Text(String(format: "%.1f g", macro))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 160, height: 80)
                        .clipped()
                    }
                    HStack {
                        Text("Fett:")
                            .font(Fonts.entryTitle)
                            .foregroundColor(Color("FatPrimaryColor"))
                            .frame(width: 160, alignment: .leading)
                        Picker("Fett", selection: $newEntryFat) {
                            ForEach(macroRange, id: \.self) { macro in
                                Text(String(format: "%.1f g", macro))
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 160, height: 80)
                        .clipped()
                    }
                }
                Section {
                    Button("Hinzufügen") {
                        let newEntry = Entry(
                            title: newEntryTitle,
                            date: newEntryDate,
                            calories: newEntryCalories,
                            carbohydrates: newEntryCarbohydrates,
                            protein: newEntryProtein,
                            fat: newEntryFat,
                            type: newEntryType,
                            isFavorite: newEntryIsFavorite
                        )
                        context.insert(newEntry)
                        newEntryTitle = ""
                        newEntryCalories = 0
                        newEntryType = .breakfast
                        sheetIsVisible = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color("SecondaryColor"))
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color("PrimaryColor"))
                    )
                }
            }
            .presentationDetents([.height(500)])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    @Previewable @State var sheetIsVisible: Bool = true
    @Previewable @State var newEmptyEntry: Entry = Entry(title: "", date: Date(), calories: 0, carbohydrates: 0, protein: 0, fat: 0, type: .breakfast)
    EntryFormSheetView(sheetIsVisible: $sheetIsVisible, newEntryTitle: $newEmptyEntry.title, newEntryDate: $newEmptyEntry.date, newEntryCalories: $newEmptyEntry.calories, newEntryCarbohydrates: $newEmptyEntry.carbohydrates, newEntryProtein: $newEmptyEntry.protein, newEntryFat: $newEmptyEntry.fat, newEntryType: $newEmptyEntry.type, newEntryIsFavorite: $newEmptyEntry.isFavorite)
}
