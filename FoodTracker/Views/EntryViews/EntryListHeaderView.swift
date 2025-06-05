//
//  EntryListHeaderView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 27.05.25.
//

import SwiftData
import SwiftUI

struct EntryListHeaderView: View {
    @Environment(\.modelContext) var context
    @State var alertIsVisible: Bool = false
    @Query var entries: [Entry]
    @Binding var selectedDate: Date
    var body: some View {
        HStack {
            Text("Einträge")
                .font(Fonts.listTitle)
            Spacer()
            Button("Alles löschen") {
                alertIsVisible = true
            }
            .foregroundColor(.red)
            .alert(
                "Bist du sicher, dass du alle Einträge löschen willst?",
                isPresented: $alertIsVisible
            ) {
                Button("Abbrechen", role: .cancel) {}
                Button("Löschen", role: .destructive) {
                    for entry in entries {
                        if Calendar.current.isDate(
                            entry.date,
                            inSameDayAs: selectedDate
                        ) {
                            context.delete(entry)
                        }
                    }
                }
            }
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    @Previewable @State var selectedDate = Date()
    EntryListHeaderView(selectedDate: $selectedDate)
}
