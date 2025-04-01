//
//  PersonTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/04/2025.
//

import SwiftUI

struct PersonTile<Content: View>: View {
    var person: User
    @ViewBuilder let content:  ()-> Content

    var body: some View {
        HStack {
            ProfileAvatarCircle(size: 42, avatarURL: person.avatarURL, initials: person.initials)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(person.fullname)
                    .font(.subheadline.weight(.medium))
                
                Text(person.email)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            content()
        }
    }
}

#Preview {
    PersonTile(person: User.mockUsers[0]) {
        Spacer()
    }
    .padding()
}
