//
//  ProfileWithDateTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/03/2025.
//

import SwiftUI

struct ProfileWithDateTile<Content: View>: View {
    let profileImage: AnyView
    let title: String
    let date: Date
    @ViewBuilder let content:  ()-> Content
    
    var body: some View {
        HStack(spacing: 8.0) {
            profileImage
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline.weight(.medium))
                Text(date.formatted(.dateTime.day().month(.abbreviated).year().hour().minute()))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            content()
        }
        
    }
}

#Preview {
    let announcement = Announcement.mockAnnouncements[0]
    
    ProfileWithDateTile(profileImage:  announcement.image as! AnyView, title: announcement.title, date: announcement.createdAt) {
        Spacer()
        Image(systemName: "ellipsis")
    }
    .padding()
}
