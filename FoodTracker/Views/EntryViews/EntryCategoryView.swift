//
//  EntryCategoryView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 31.05.25.
//

import SwiftUI

struct EntryCategoryView: View {
    var categoryEmoji: String {
        switch entryType {
        case .breakfast:
            "🥐"
        case .lunch:
            "🍝"
        case .dinner:
            "🥗"
        case .drink:
            "🥤"
        case .snack:
            "🍫"
        }
    }
    var entryType: EntryType
    var categoryColor: Color {
        switch entryType {
        case .breakfast:
            Color("BreakfastTypeColor")
        case .lunch:
            Color("LunchTypeColor")
        case .dinner:
            Color("DinnerTypeColor")
        case .drink:
            Color("DrinkTypeColor")
        case .snack:
            Color("SnackTypeColor")
        }
    }
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(categoryColor)
                    .frame(width: 100)
                Circle()
                    .fill(.white.opacity(0.4))
                    .frame(width: 72)
                Text(categoryEmoji)
                    .font(.system(size: 40))
            }
            Text(entryType.rawValue)
                .foregroundColor(categoryColor)
                .font(Fonts.entryDetailBadge)
        }
    }
}

#Preview {
    @Previewable var entryType: EntryType = .snack
    EntryCategoryView(entryType: entryType)
}
