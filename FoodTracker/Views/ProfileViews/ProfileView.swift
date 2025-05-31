//
//  ProfileView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: User
    @State var formIsVisible: Bool = false
    
    var body: some View {
        if formIsVisible {
            ProfileFormView(user: $user, formIsVisible: $formIsVisible)
        } else {
            ProfileDetailsView(user: $user, formIsVisible: $formIsVisible)
        }
    }
}

#Preview {
    @Previewable @State var user: User = User(
        name: "Rylie",
        sex: .male,
        heightInMeter: 1.64,
        weightInKilogram: 63.2,
        activityLevel: .low,
        weightGoal: .maintain,
        diet: .veganRegular
    )
    ProfileView(user: $user)
}
