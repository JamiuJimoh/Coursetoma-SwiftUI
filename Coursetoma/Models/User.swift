//
//  User.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 02/12/2024.
//

import Foundation

struct User: Codable, Equatable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    let avatar: String?
    
    var avatarURL: URL? {
        guard let avatar else { return nil }
        return URL(string: avatar)
    }
    
    var fullname: String { "\(firstname) \(lastname)" }

    var initials: String {
        var str = ""
        if !firstname.isEmpty {
            str += firstname.prefix(1)
        }
        if !lastname.isEmpty {
            str += lastname.prefix(1)
        }
        return str.uppercased()
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstname = "firstname"
        case lastname = "lastname"
        case email = "email"
        case avatar = "avatar_url"
    }
    
    static var mockCurrentUser: User {
        User(
            id: "12345",
            firstname: "Jamiu",
            lastname: "Jimoh",
            email: "jamiu@jimoh.com",
//            avatar: nil
            avatar: "https://imgs.search.brave.com/a5MP8rG0_FYIUSAX7YpUPohAy3keQB832Oue2gAEuOU/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YTIuZGV2LnRvL2R5/bmFtaWMvaW1hZ2Uv/d2lkdGg9ODAwLGhl/aWdodD0sZml0PXNj/YWxlLWRvd24sZ3Jh/dml0eT1hdXRvLGZv/cm1hdD1hdXRvL2h0/dHBzOi8vcm9ib2hh/c2gub3JnL21haWxA/YXNoYWxsZW5kZXNp/Z24uY28udWs"
        )
    }
    
    static var mockUsers: [User] = [
        User(
            id: "admin_001",
            firstname: "Admin",
            lastname: "User",
            email: "admin@example.com",
            avatar: "https://example.com/avatar/admin.png"
        ),
        User(
            id: "student_001",
            firstname: "Jane",
            lastname: "Doe",
            email: "jane.doe@example.com",
            avatar: "https://example.com/avatar/jane.png"
        ),
        User(
            id: "teacher_001",
            firstname: "John",
            lastname: "Smith",
            email: "john.smith@example.com",
            avatar: nil
        ),
        User(
            id: "student_002",
            firstname: "Alice",
            lastname: "Johnson",
            email: "alice.johnson@example.com",
            avatar: "https://example.com/avatar/alice.png"
        ),
        User(
            id: "admin_002",
            firstname: "Bob",
            lastname: "Admin",
            email: "bob.admin@example.com",
            avatar: "https://example.com/avatar/bob.png"
        ),
    ]
}
