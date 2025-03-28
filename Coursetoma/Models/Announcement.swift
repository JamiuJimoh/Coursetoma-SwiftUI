//
//  Announcement.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 26/03/2025.
//

import SwiftUI

struct Announcement: Identifiable {
    let id: String
    let commentCount: Int
    let type: AnnouncementType
    let creator: User
    let createdAt: Date
    
    var message: String? {
        switch type {
        case .normal(let text, _): text
        case .material: nil
        }
    }
    var attachments: [Attachment]? {
        switch type {
        case .normal( _, let attachments): attachments
        case .material(let material): material.attachments
        }
    }
    
    var title: String {
        switch type {
        case .normal: creator.fullname
        case .material(let material): "New material: \(material.title)"
        }
    }
    
    let imageSize: CGFloat = 43
    
    @ViewBuilder
    var image: some View {
        switch type {
        case .normal: ProfileAvatarCircle(size: imageSize, avatarURL: creator.avatarURL, initials: creator.initials)
        case .material:
            Image(systemName: "document.on.clipboard")
                .foregroundStyle(.appPrimary)
                .padding(12)
                .borderedContainerStyle(cornerRadius: imageSize)
                .background(.appPrimaryFeint)
                .clipShape(.rect(cornerRadius: imageSize))
        }
    }
    
    enum AnnouncementType {
        case normal(String, [Attachment]?)
        case material(Material)
        
    }
}

extension Announcement {
    static let mockAnnouncements: [Announcement] = [
        Announcement(
            id: "announcement_001",
            commentCount: 2,
            type: .normal("Welcome to the platform!", Array(Attachment.mockAttachments[...1])
            ),
            creator: User.mockUsers[0],
            createdAt: Date()
        ),
        Announcement(
            id: "announcement_002",
            commentCount: 0,
            type: .material(Material.mockMaterials[2]),
            creator: User.mockUsers[1],
            createdAt: Date().addingTimeInterval(-86400) // 1 day ago
        ),
        Announcement(
            id: "announcement_003",
            commentCount: 3,
            type: .material(Material.mockMaterials[0]),
            creator: User.mockUsers[2],
            createdAt: Date().addingTimeInterval(-172800) // 2 days ago
        ),
        Announcement(
            id: "announcement_004",
            commentCount: 2,
            type: .normal("Reminder: Submit your assignments.", nil),
            creator: User.mockUsers[3],
            createdAt: Date().addingTimeInterval(-259200) // 3 days ago
        ),
        Announcement(
            id: "announcement_005",
            commentCount: 1,
            type: .normal("New features coming soon!", Attachment.mockAttachments),
            creator: User.mockUsers[4],
            createdAt: Date().addingTimeInterval(-345600) // 4 days ago
        )
    ]
}
