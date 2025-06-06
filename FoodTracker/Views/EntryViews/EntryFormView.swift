//
//  EntryFormView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct EntryFormView: View {
    @State var sheetIsVisible: Bool = false
    @State var emptyTitle: String = ""
    @State var emptyDate: Date = Date()
    @State var emptyCalories: Int = 0
    @State var emptyCarbohydrates: Double = 0.0
    @State var emptyProtein: Double = 0.0
    @State var emptyFat: Double = 0.0
    @State var emptyType: EntryType = .breakfast
    @State var emptyIsFavorite: Bool = false
    
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
                EntryFormSheetView(sheetIsVisible: $sheetIsVisible, newEntryTitle: $emptyTitle, newEntryDate: $emptyDate, newEntryCalories: $emptyCalories, newEntryCarbohydrates: $emptyCarbohydrates, newEntryProtein: $emptyProtein, newEntryFat: $emptyFat, newEntryType: $emptyType, newEntryIsFavorite: $emptyIsFavorite)
            }
        }
    }
}

#Preview {
    EntryFormView()
}
