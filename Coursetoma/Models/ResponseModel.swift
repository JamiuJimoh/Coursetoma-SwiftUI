//
//  ResponseModel.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 30/11/2024.
//

import Foundation

struct ResponseModel<T>: Codable where T: Codable {
    let message: String
    let status: String
    let statusCode: Int
    let data: T?
}

struct AuthResponseModel: Codable {
    let accessToken: String
    let user: User?

    enum CodingKeys: String, CodingKey {
        case accessToken = "accesstoken"
        case user = "user"
    }
}
