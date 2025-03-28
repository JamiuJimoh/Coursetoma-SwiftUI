//
//  ProfilePage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 15/02/2025.
//

import SwiftUI

struct ProfilePage: View {
    @Environment(\.authStore) private var authStore

    var body: some View {
        VStack {
            Button ("Logout") {
                authStore.logout()
            }
        }
    }
}

#Preview {
    ProfilePage()
}
