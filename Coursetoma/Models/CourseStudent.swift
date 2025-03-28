//
//  CourseStudent.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 18/12/2024.
//

import Foundation

struct CourseStudent: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let avatarURL: String?
    let enrolledAt: Date?
    let status: CourseStatus
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case avatarURL = "avatar_url"
        case enrolledAt = "joined_at"
        case status
    }
}
