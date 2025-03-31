//
//  Attachment.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 26/03/2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct Attachment: Equatable, Identifiable {
    let id: String
    let url: URL
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
    
    static func getFileType(for url: URL) -> AttachmentType {
        guard let type = UTType(filenameExtension: url.pathExtension) else { return .file }

        if type.conforms(to: .image) { return .image }
        return .file
    }
    
    static let mockAttachments: [Attachment] = [
        Attachment(
            id: "attachment_006",
            url: URL(filePath: "Year.png")!,
            type: .image,
            createdAt: Date().addingTimeInterval(-14400) // 4 hours ago
        ),
        Attachment(
            id: "attachment_007",
            url: URL(filePath: "Olamilekan.pdf")!,
            type: .file,
            createdAt: Date().addingTimeInterval(-18000) // 5 hours ago
        ),
        Attachment(
            id: "attachment_008",
            url: URL(string: "https://www.google.com")!,
            type: .link,
            createdAt: Date().addingTimeInterval(-21600) // 6 hours ago
        )
        
    ]
    
}
