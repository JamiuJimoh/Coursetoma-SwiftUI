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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let message = announcement.message {
                Text(message)
                    .font(.footnote)
            }
            
            if !attachments.isEmpty {
                HStack {
                    ForEach(attachments) { attachment in
                        HStack(spacing: 8) {
                            attachment.image
                                .foregroundStyle(.appPrimary)
                            
                            //TODO: - Fix file name
                            Text(attachment.content.suggestedFilename ?? "file")
                                .font(.footnote.weight(.medium))
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .borderedContainerStyle(cornerRadius: 16)
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
