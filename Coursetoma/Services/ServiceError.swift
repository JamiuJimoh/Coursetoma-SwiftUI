//
//  ServiceError.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/11/2024.
//

import Foundation

enum ServiceError: Error {
    case invalidResponse(String, Int)
    case invalidRequest
}

extension Error {
    var message: String {
        if let serviceError = self as? ServiceError {
            switch serviceError {
            case .invalidResponse(_, let code) where code == 401:
                return "Unauthorized access. Login to perform this action!"
            case .invalidResponse(let description, _):
                return description
            case .invalidRequest:
                return "An error occurred"
            }
        }
        return "An error occurred"
    }
}
