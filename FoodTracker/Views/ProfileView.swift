//
//  ProfileView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: User
    @State var newUser: User
    @State var formIsVisible: Bool = false
    var body: some View {
        if formIsVisible {
            Form {
                Section("Name") {
                    TextField("Name", text: $newUser.name)
                }
                Section("Kalorienziel") {
                    Stepper(
                        value: $newUser.calorieGoal,
                        in: 0...10000,
                        step: 10
                    ) {
                        Text("\(newUser.calorieGoal) kcal")
                    }
                }
                Section {
                    HStack {
                        Button("Abbrechen") {
                            newUser = user
                            formIsVisible = false
                        }
                        Spacer()
                        Button("Speichern") {
                            user = newUser
                            formIsVisible = false
                        }
                    }
                }
            }
        } else {
            Text("Name: \(user.name)")
            Text("Kalorienziel: \(user.calorieGoal) kcal")
            Button("Bearbeiten") {
                formIsVisible = true
            }
        }
    }
    
    init(user: Binding<User>) {
        self._user = user
        self.newUser = User(name: user.wrappedValue.name, calorieGoal: user.wrappedValue.calorieGoal)
    }
}

#Preview {
    @Previewable @State var user = User(name: "Rylie", calorieGoal: 2000)
    ProfileView(user: $user)
}
