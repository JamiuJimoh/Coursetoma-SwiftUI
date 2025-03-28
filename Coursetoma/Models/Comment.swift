//
//  Comment.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import Foundation

struct Comment: Identifiable {
    let id: String
    let text: String
    let creator: User
    let createdAt: Date
    
    static let mockComments: [Comment] = [
        Comment(
            id: "C1",
            text: "This is a great announcement! Thanks for sharing.",
            creator: User.mockCurrentUser,
            createdAt: Date()
        ),
        Comment(
            id: "C2",
            text: "Does anyone have additional resources for this topic?",
            creator: User.mockUsers[0],
            createdAt: Date()
        ),
        Comment(
            id: "C3",
            text: "Looking forward to the next update!",
            creator: User.mockUsers[2],
            createdAt: Date()
        ),
        Comment(
            id: "C4",
            text: "Can we get more details on this?",
            creator: User.mockUsers[4],
            createdAt: Date()
        ),
        Comment(
            id: "C5",
            text: "This really helps, thanks a lot!",
            creator: User.mockUsers[1],
            createdAt: Date()
        )
    ]
}
