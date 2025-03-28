//
//  WelcomeSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 15/02/2025.
//


import SwiftUI

struct WelcomeSection: View {
    let user = User.mockCurrentUser
    
    var body: some View {
        HStack {
            ProfileAvatarCircle(avatarURL: user.avatarURL, initials: user.initials)
                .padding(.trailing, 8)
            Text("Welcome \(user.firstname)")
                .font(.title2.weight(.medium))
            Spacer()
        }
    }
}
