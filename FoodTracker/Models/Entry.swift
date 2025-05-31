//
//  Entry.swift
//  FoodTracker
//
//  Created by Rylie Castell on 26.05.25.
//

import Foundation

struct Entry: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var date: Date
    var calories: Int
    var carbohydrates: Double
    var protein: Double
    var fat: Double
    var type: EntryType

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "de_DE")
        return formatter.string(from: date)
    }
}
