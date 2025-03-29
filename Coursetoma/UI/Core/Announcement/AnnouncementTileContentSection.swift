//
//  AnnouncementTileContentSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct AnnouncementTileContentSection: View {
    var announcement: Announcement
    
    var attachments: [Attachment] { announcement.attachments ?? [] }
    
    let columns = [
        GridItem(.adaptive(minimum: 120)) // Adaptive layout
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let message = announcement.message {
                Text(message)
                    .font(.footnote)
            }
            
            if !attachments.isEmpty {
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(attachments) { attachment in
                        
                        AttachmentTile(attachment: attachment)
                            .onTapGesture {
                                //TODO: - Make this clickable to view attachments
                                print("Attachment")
                            }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AnnouncementTileContentSection(announcement: Announcement.mockAnnouncements[0])
}
