//
//  AnnouncementMakerButton.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/03/2025.
//

import SwiftUI

struct AnnouncementMakerButton: View {
    @State private var showSheet = false
    
    var currentUser: User { User.mockCurrentUser }
    
    var body: some View {
        HStack(spacing: 12) {
            ProfileAvatarCircle(size: 40, avatarURL: currentUser.avatarURL, initials: currentUser.initials)
            
            Text("Announce something to the class")
                .font(.subheadline)
                .foregroundStyle(.appPrimary)
            
            Spacer()
            
            Image(systemName: "megaphone")
                .foregroundStyle(.appPrimary)
        }
        .padding(10)
        .background(.appPrimaryFeint)
        .borderedContainerStyle()
        .clipShape(.rect(cornerRadius: 8))
        .onTapGesture {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) { CreateAnnouncementPage() }
    }
}

#Preview {
    AnnouncementMakerButton()
}
