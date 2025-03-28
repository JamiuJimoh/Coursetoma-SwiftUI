//
//  Material.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/03/2025.
//

import Foundation

struct Material: Identifiable {
    let id: String
    let title: String
    let description: String?
    let attachments: [Attachment]?
    
    static let mockMaterials: [Material] = [
        Material(
            id: "M1",
            title: "Week 1 Study Material",
            description: "Contains lecture slides and reference PDFs",
            attachments: [Attachment.mockAttachments[1]]
        ),
        Material(
            id: "M2",
            title: "Practice Exercises",
            description: "Extra exercises for reinforcement",
            attachments: nil
        ),
        Material(
            id: "M3",
            title: "Assignment 1",
            description: "Submit by Friday. Instructions included.",
            attachments: Attachment.mockAttachments
        ),
        Material(
            id: "M4",
            title: "Supplementary Video",
            description: "Watch this video for a deeper understanding of the topic.",
            attachments: [Attachment.mockAttachments.first!]
        ),
        Material(
            id: "M5",
            title: "Week 2 Study Guide",
            description: "Includes key topics for the second week.",
            attachments: [Attachment.mockAttachments.last!]
        ),
    ]
}
