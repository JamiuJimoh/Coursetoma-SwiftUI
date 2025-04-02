//
//  AnnouncementDetailsPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/03/2025.
//

import SwiftUI

struct AnnouncementDetailsPage: View {
    @State private var showComments = false
    var announcement: Announcement
    @Binding var isSheetOpen: Bool
    

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ProfileWithDateTile(
                        profileImage: announcement.image as! AnyView,
                        title: announcement.title,
                        date: announcement.createdAt
                    ) {
                        Spacer()
                    }
                    
                        
                    if let message = announcement.detailsDescription {
                        Text(message)
                            .font(.footnote)
                    }
                    
                    Divider()
                        .dividerStyle()

                    //MARK: - ATTACHMENTS SECTION
                    if let attachments = announcement.attachments {
                        VStack(alignment:.leading, spacing: 8) {
                            Text("Attachments")
                                .textFieldLabelStyle()
                            
                            HStack(spacing: 12) {
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
                    //MARK: - ATTACHMENTS SECTION END

                    Divider()
                        .dividerStyle()
                    
                    Button {
                        showComments = true
                    } label: {
                        Spacer()
                        Label(announcement.commentText, systemImage: "text.bubble")
                        Spacer()
                    }
                    .sheet(isPresented: $showComments) {
                        CommentsPage(announcementID: announcement.id, showComments: $showComments)
                    }
                }
                .padding()
            }
            .toolBarWithCloseButton()
        }
    }
}

#Preview {
    AnnouncementDetailsPage(announcement: Announcement.mockAnnouncements[0], isSheetOpen: .constant(true))
}
