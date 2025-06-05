//
//  ProfileView.swift
//  FoodTracker
//
//  Created by Rylie Castell on 30.05.25.
//

import SwiftUI

struct ProfileView: View {
    @State var formIsVisible: Bool = false

    var body: some View {
        if formIsVisible {
            ProfileFormView(formIsVisible: $formIsVisible)
        } else {
            ProfileDetailsView(formIsVisible: $formIsVisible)
        }
    }
}

#Preview {
    ProfileView()
}
