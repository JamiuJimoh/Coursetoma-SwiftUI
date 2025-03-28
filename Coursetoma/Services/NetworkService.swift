//
//  NetworkService.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 06/12/2024.
//

import Foundation

public protocol NetworkService {
    var baseURL: String { get }
    var accessToken: String? { get }
    func post<T>(path: String, reqBody: Encodable?) async throws -> T? where T : Codable
    func get<T>(path: String) async throws -> T where T : Codable
    func saveAccessToken(token: String) throws
    func getAccessToken() -> String?
    func deleteAccessToken() throws
}

class NetworkServiceImpl: NetworkService {
    let baseURL = "http://127.0.0.1:8080"
    var accessToken: String? = nil
    
    private let accessTokenKey = "accessToken"

    static let shared = NetworkServiceImpl()
    private init() {}
    
    private static let dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    func get<T>(path: String) async throws -> T where T : Codable {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw ServiceError.invalidRequest
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let accessToken {
            req.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        print(url)

        let (data, response) = try await URLSession.shared.data(for: req)
        
        let res = response as? HTTPURLResponse
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            guard let date = NetworkServiceImpl.dateFormatter.date(from: dateString) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid ISO8601 date format"
                )
            }
            return date
        }
        
        guard let decoded = try? decoder.decode(ResponseModel<T>.self, from: data) else {
            print("Error while decoding \(String(describing: try JSONSerialization.jsonObject(with: data, options: .topLevelDictionaryAssumed) ))")
            throw ServiceError.invalidRequest
        }
        
        if let res, res.statusCode > 399 {
            throw ServiceError.invalidResponse(decoded.message, res.statusCode)
        }
        
        return decoded.data!
    }

    func post<T>(path: String, reqBody: Encodable? = nil) async throws -> T? where T : Codable {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw ServiceError.invalidRequest
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let accessToken {
            req.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        
        if let reqBody {
            let encoder = JSONEncoder()
            guard let jsonData = try? encoder.encode(reqBody) else {
                print("Error while encoding \(reqBody)")
                throw ServiceError.invalidRequest
            }
            req.httpBody = jsonData
        }
        
        let (data, response) = try await URLSession.shared.data(for: req)
        let res = response as? HTTPURLResponse
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            guard let date = NetworkServiceImpl.dateFormatter.date(from: dateString) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid ISO8601 date format"
                )
            }
            return date
        }
        guard let decoded = try? decoder.decode(ResponseModel<T>.self, from: data) else {
            print("Error while decoding \(String(describing: try JSONSerialization.jsonObject(with: data, options: .topLevelDictionaryAssumed) ))")
            throw ServiceError.invalidRequest
        }
        
        if let res, res.statusCode > 399 {
            throw ServiceError.invalidResponse(decoded.message, res.statusCode)
        }
        
        return decoded.data
    }
    
    func saveAccessToken(token: String) throws {
        accessToken = token
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accessTokenKey,
            kSecValueData as String: token.data(using: .utf8)!
        ]
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw ServiceError.invalidRequest
        }
    }
    
    func getAccessToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accessTokenKey,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else { return nil }
        guard status == errSecSuccess else { return nil }
        guard let data = item as? Data else { return nil }
        let token =  String(data: data, encoding: .utf8)
        accessToken = token
        return token
    }
    
    func deleteAccessToken() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: accessTokenKey,
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess else {
            throw ServiceError.invalidRequest
        }
    }
}
