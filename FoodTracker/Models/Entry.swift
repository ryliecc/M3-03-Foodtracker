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
}
