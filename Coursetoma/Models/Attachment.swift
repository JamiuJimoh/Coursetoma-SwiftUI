//
//  Attachment.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 26/03/2025.
//

import SwiftUI

struct Attachment: Identifiable {
    let id: String
    let content: Data
    let type: AttachmentType
    let createdAt: Date
    
    var image: Image {
        switch type {
        case .image: Image(systemName: "photo")
        case .file: Image(systemName: "text.document")
        case .link: Image(systemName: "link")
        }
    }
    
    enum AttachmentType: String {
        case image
        case file
        case link
    }
    
    static let mockAttachments: [Attachment] = [
        Attachment(
            id: "attachment_006",
            content: Data("Year.png".utf8),
            //                    content: Data(contentsOf: <#T##URL#>),
            type: .image,
            createdAt: Date().addingTimeInterval(-14400) // 4 hours ago
        ),
        Attachment(
            id: "attachment_007",
            content: Data("Olamilekan.pdf".utf8),
            type: .file,
            createdAt: Date().addingTimeInterval(-18000) // 5 hours ago
        ),
        Attachment(
            id: "attachment_008",
            content: Data("https://www.google.com".utf8),
            type: .link,
            createdAt: Date().addingTimeInterval(-21600) // 6 hours ago
        )
        
    ]
    
}
