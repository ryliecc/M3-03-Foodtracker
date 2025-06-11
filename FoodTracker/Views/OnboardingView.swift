//
//  OnboardingView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 11.06.25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("firstTimeUser") var isFirstTimeUser = true
    @AppStorage("username") private var username: String = "Gast"
    @State private var currentPage: Int = 0
    @State private var newUserName: String = ""
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                VStack {
                    Text("Willkommen zu Nutri Log!")
                    Text("Bitte gib deinen Namen ein:")
                    TextField("Name", text: $newUserName)
                }
                .tag(0)
                VStack {
                    Text("Wieviel wiegst du?")
                }
                .tag(1)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            HStack {
                if currentPage >= 1 {
                    Button("Zurück") {
                        currentPage -= 1
                    }
                }
                Button("Weiter") {
                    currentPage += 1
                }
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
