//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 26.05.25.
//

import SwiftUI

struct EntryListView: View {
    var entries: [Entry] = [
        Entry(title: "Frühlingsrolle", date: Date(), calories: 154),
        Entry(title: "Veganer Chicken Burger", date: Date(), calories: 473),
        Entry(title: "Rührtofu", date: Date(), calories: 435),
        Entry(title: "Pasta al Pesto", date: Date(), calories: 236),
    ]
    
    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EntryListView()
}
