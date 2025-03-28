//
//  Course.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 06/12/2024.
//

import SwiftUI

protocol Course: Codable, Identifiable, Hashable, Equatable {
    var id: String {get}
    var author: String{get}
    var title: String{get}
    var description: String?{get}
    var code: String?{get}
    var iv: String{get}
    var banner: String?{get}
    var createdAt: Date{get}
    var updatedAt: Date? {get}
    
    func isEqual(to other: any Course) -> Bool
}

struct StudentCourse: Course {
    let id: String
    let author: String
    let title: String
    let description: String?
    let code: String?
    let iv: String
    let banner: String?
    let status: CourseStatus
    let createdAt: Date
    let updatedAt: Date?
    let joinedAt: Date
    let enrolledAt: Date?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "creator_id"
        case title = "title"
        case description = "description"
        case code = "code"
        case iv = "iv"
        case banner = "banner"
        case status = "status"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case joinedAt = "joined_at"
        case enrolledAt = "enrolled_at"
    }
    
    func isEqual(to other: any Course) -> Bool {
        guard let otherCourse = other as? StudentCourse else { return false }
        return self == otherCourse
    }

    // Sample Courses

    static func generateSampleCourses() -> [StudentCourse] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let now = Date()
        let oneDayAgo = Calendar.current.date(byAdding: .day, value: -1, to: now)!
        let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: now)!
        
        return [
            StudentCourse(id: "course1", author: "John Doe", title: "Swift Basics", description: "Learn the basics of Swift programming.", code: "SW101", iv: "iv1", banner: "banner1", status: .pending, createdAt: oneDayAgo, updatedAt: now, joinedAt: now, enrolledAt: now),
            
            StudentCourse(id: "course2", author: "Jane Smith", title: "Advanced iOS", description: "Dive deeper into iOS development.", code: "IOS202", iv: "iv2", banner: "banner2", status: .enrolled, createdAt: threeDaysAgo, updatedAt: threeDaysAgo, joinedAt: oneDayAgo, enrolledAt: oneDayAgo),
            
            StudentCourse(id: "course3", author: "Alice Brown", title: "UI/UX Design", description: "Master the art of design for apps.", code: "UIUX303", iv: "iv3", banner: "banner3", status: .blocked, createdAt: oneDayAgo, updatedAt: nil, joinedAt: now, enrolledAt: nil),
            
            StudentCourse(id: "course4", author: "Bob Johnson", title: "Machine Learning", description: "Get introduced to machine learning concepts.", code: "ML404", iv: "iv4", banner: "banner4", status: .enrolled, createdAt: threeDaysAgo, updatedAt: now, joinedAt: oneDayAgo, enrolledAt: nil),
            
            StudentCourse(id: "course5", author: "Eve White", title: "Web Development", description: "Learn how to build full-stack web applications.", code: "WD505", iv: "iv5", banner: "banner5", status: .pending, createdAt: now, updatedAt: nil, joinedAt: oneDayAgo, enrolledAt: now)
        ]
    }

    static let mock = generateSampleCourses()
}

struct InstructorCourse: Course {
    let id: String
    let author: String
    let title: String
    let description: String?
    let code: String?
    let iv: String
    let banner: String?
    let createdAt: Date
    let updatedAt: Date?
    let permissions: CourseInstructorPermissions

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "creator_id"
        case title = "title"
        case description = "description"
        case code = "code"
        case iv = "iv"
        case banner = "banner"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case permissions = "permissions"
    }
    
    func isEqual(to other: any Course) -> Bool {
        guard let otherCourse = other as? InstructorCourse else { return false }
        return self == otherCourse
    }

    // Generate sample Instructor Courses with permissions
    static func generateSampleInstructorCourses() -> [InstructorCourse] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let now = Date()
        let oneDayAgo = Calendar.current.date(byAdding: .day, value: -1, to: now)!
        let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: now)!
        
        return [
            InstructorCourse(id: "course1", author: "John Doe", title: "Advanced Swift", description: "Learn advanced Swift techniques.", code: "SW201", iv: "iv1", banner: "banner1", createdAt: oneDayAgo, updatedAt: now, permissions: CourseInstructorPermissions(canEdit: true, canDelete: true, canInviteStudent: true, canInviteInstructor: false, canManageStudent: true)),
            
            InstructorCourse(id: "course2", author: "Jane Smith", title: "iOS Fundamentals", description: "A beginner course for iOS development.", code: "IOS101", iv: "iv2", banner: "banner2", createdAt: threeDaysAgo, updatedAt: threeDaysAgo, permissions: CourseInstructorPermissions(canEdit: true, canDelete: false, canInviteStudent: true, canInviteInstructor: true, canManageStudent: false)),
            
            InstructorCourse(id: "course3", author: "Alice Brown", title: "UI/UX Design", description: "Master the principles of UI/UX design.", code: "UIUX303", iv: "iv3", banner: "banner3", createdAt: oneDayAgo, updatedAt: nil, permissions: CourseInstructorPermissions(canEdit: false, canDelete: false, canInviteStudent: true, canInviteInstructor: false, canManageStudent: false)),
            
            InstructorCourse(id: "course4", author: "Bob Johnson", title: "Machine Learning", description: "Learn machine learning from scratch.", code: "ML404", iv: "iv4", banner: "banner4", createdAt: threeDaysAgo, updatedAt: now, permissions: CourseInstructorPermissions(canEdit: true, canDelete: true, canInviteStudent: true, canInviteInstructor: true, canManageStudent: true)),
            
            InstructorCourse(id: "course5", author: "Eve White", title: "Web Development", description: "Build full-stack web applications.", code: "WD505", iv: "iv5", banner: "banner5", createdAt: now, updatedAt: nil, permissions: CourseInstructorPermissions(canEdit: true, canDelete: false, canInviteStudent: false, canInviteInstructor: false, canManageStudent: true))
        ]
    }

    static let mock = generateSampleInstructorCourses()
}

struct CourseInstructorPermissions: Codable, Equatable, Hashable {
    let canEdit: Bool
    let canDelete: Bool
    let canInviteStudent: Bool
    let canInviteInstructor: Bool
    let canManageStudent: Bool
    
    enum CodingKeys: String, CodingKey {
        case canEdit = "can_edit"
        case canDelete = "can_delete"
        case canInviteStudent = "can_invite_student"
        case canInviteInstructor = "can_invite_instructor"
        case canManageStudent = "can_manage_student"
    }
}


enum CourseStatus: String, Codable, Equatable {
    case pending
    case enrolled
    case blocked
}

