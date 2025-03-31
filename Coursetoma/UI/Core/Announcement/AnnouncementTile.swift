//
//  AnnouncementTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/03/2025.
//

import SwiftUI

struct AnnouncementTile: View {
    @State private var showComments = false
    @State private var showDetails = false

    var announcement: Announcement
    
    var creator: User { announcement.creator }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                //MARK: - PROFILE SECTION
                AnnouncementTileProfileSection(announcement: announcement)
                
                //MARK: - CONTENT SECTION
                AnnouncementTileContentSection(announcement: announcement)
            }
            .padding(.horizontal, 12)
            .contentShape(Rectangle())
            .onTapGesture { showDetails = true }

            //MARK: - COMMENT SECTION
            VStack(alignment: .leading, spacing: 12) {
                Divider()
                    .frame(height: 1)
                    .overlay(.appGreyBorder)
                
                Text(announcement.commentText)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.appFontSubheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 2)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture { showComments = true }
            .sheet(isPresented: $showComments) {
                CommentsPage(announcementID: announcement.id, showComments: $showComments)
            }
            .sheet(isPresented: $showDetails) {
                AnnouncementDetailsPage(announcement: announcement, isSheetOpen: $showDetails)
            }

        }
        .padding(.vertical, 12)
        .borderedContainerStyle()
    }
}

#Preview {
    AnnouncementTile(announcement: Announcement.mockAnnouncements[0])
        .padding()
}
