//
//  AnnouncementTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/03/2025.
//

import SwiftUI

struct AnnouncementTile: View {
    @State private var showComments = false
    
    var announcement: Announcement
    
    var creator: User { announcement.creator }
    var commentText: String {
        if announcement.commentCount == 0 {
            return "Add class comment"
        } else if announcement.commentCount == 1 {
            return "1 class comment"
        } else {
            return "\(announcement.commentCount) class comments"
        }
    }

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
            .onTapGesture {
                //TODO: - Make this clickable to view announcement details
                print("Announcement details")
            }

            //MARK: - COMMENT SECTION
            VStack(alignment: .leading, spacing: 12) {
                Divider()
                    .frame(height: 1)
                    .overlay(.appGreyBorder)
                
                Text(commentText)
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

        }
        .padding(.vertical, 12)
        .borderedContainerStyle()
    }
}

#Preview {
    AnnouncementTile(announcement: Announcement.mockAnnouncements[0])
        .padding()
}
