//
//  ContentView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            EntryListView()
        }
    }
}

#Preview {
    ContentView()
}
