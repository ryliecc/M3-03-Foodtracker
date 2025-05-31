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
    @State var newEntryDate: Date = Date()
    @State var newEntryCalories: Int = 0
    @State var newEntryCarbohydrates: Double = 0.0
    @State var newEntryProtein: Double = 0.0
    @State var newEntryFat: Double = 0.0
    @State var carbohydratesText: String = ""
    @State var proteinText: String = ""
    @State var fatText: String = ""
    @State var newEntryType: EntryType = .breakfast

    @Binding var entries: [Entry]
    
    var calorieRange: [Int] {
        Array(stride(from: 0, through: 3000, by: 1))
    }
    var macroRange: [Double] {
        Array(stride(from: 0.0, through: 1000, by: 0.1))
    }
    
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
                                Picker("Kohlenhydrate", selection: $newEntryCarbohydrates) {
                                    ForEach(macroRange, id: \.self) { macro in
                                        Text(String(format: "%.1f g", macro))}
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
                                        Text(String(format: "%.1f g", macro))}
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
                                        Text(String(format: "%.1f g", macro))}
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
                                    type: newEntryType
                                )
                                entries.append(newEntry)
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
            type: .snack
        ),
        Entry(
            title: "Veganer Chicken Burger",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 473,
            carbohydrates: 30,
            protein: 5.2,
            fat: 15,
            type: .lunch
        ),
        Entry(
            title: "Rührtofu",
            date: Date(),
            calories: 435,
            carbohydrates: 4,
            protein: 23.6,
            fat: 35.3,
            type: .breakfast
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
            type: .drink
        ),
        Entry(
            title: "Laugenbrezel",
            date: Date(),
            calories: 269,
            carbohydrates: 52,
            protein: 9.8,
            fat: 3.2,
            type: .snack
        ),
        Entry(
            title: "Wasser",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 0,
            carbohydrates: 0,
            protein: 0,
            fat: 0,
            type: .drink
        ),
        Entry(
            title: "Studentenfutter",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            calories: 462,
            carbohydrates: 44.9,
            protein: 13.8,
            fat: 29.4,
            type: .snack
        ),
    ]
    EntryFormView(entries: $entries)
}
