//
//  Enums.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import Foundation

enum EntryType: String, CaseIterable {
    case meal = "Mahlzeit"
    case drink = "Getränk"
    case snack = "Snack"
}

enum ViewSelection {
    case dashboard
    case entryList
}
