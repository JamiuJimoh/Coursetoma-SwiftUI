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
        ProfileWithDateTile(
            profileImage: announcement.image as! AnyView,
            title: announcement.titleWithMaterial,
            date: announcement.createdAt) {
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
