//
//  EntryFormView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntryFormView: View {
    @State var sheetIsVisible: Bool = false
    
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
                @State var emptyEntry = Entry(title: "", date: Date(), calories: 0, carbohydrates: 0, protein: 0, fat: 0, type: .breakfast)
                EntryFormSheetView(sheetIsVisible: $sheetIsVisible, newEntryTitle: $emptyEntry.title, newEntryDate: $emptyEntry.date, newEntryCalories: $emptyEntry.calories, newEntryCarbohydrates: $emptyEntry.carbohydrates, newEntryProtein: $emptyEntry.protein, newEntryFat: $emptyEntry.fat, newEntryType: $emptyEntry.type, newEntryIsFavorite: $emptyEntry.isFavorite)
            }
        }
    }
}

#Preview {
    EntryFormView()
}
