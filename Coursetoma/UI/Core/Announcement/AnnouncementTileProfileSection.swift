//
//  AnnouncementProfileSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct AnnouncementTileProfileSection: View {
    var announcement: Announcement
    
    var body: some View {
        HStack(spacing: 8.0) {
            announcement.image
            VStack(alignment: .leading, spacing: 4) {
                Text(announcement.title)
                    .font(.subheadline.weight(.medium))
                Text(announcement.createdAt.formatted(.dateTime.day().month(.abbreviated).year().hour().minute()))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "ellipsis")
                .onTapGesture {
                    //TODO: - Make this clickable to "more" context
                    print("More option")
                }
        }
    }
}

#Preview {
    AnnouncementTileProfileSection(announcement: Announcement.mockAnnouncements[0])
}
