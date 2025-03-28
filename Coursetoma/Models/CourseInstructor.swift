//
//  CourseInstructor.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 18/12/2024.
//

import Foundation

struct CourseInstructor: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let avatarURL: URL?
    let permissions: CourseInstructorPermissions
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "firstname"
        case lastName = "lastname"
        case email
        case avatarURL = "avatar_url"
        case permissions
    }
}
