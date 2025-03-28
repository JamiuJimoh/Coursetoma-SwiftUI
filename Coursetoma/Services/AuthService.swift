//
//  AuthService.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 14/12/2024.
//

import Foundation

//@Observable
//class AuthService: ServiceStateManagable {
//    var state: ServiceState = ServiceState.idle
//
//    @ObservationIgnored let service: NetworkService
//
//    init(_ service: NetworkService = NetworkServiceImpl.shared) {
//        self.service = service
//    }
//   
//    func login(_ store: AuthStore, email: String, password: String) async {
//        do {
//            self.state = .loading
//            let result: AuthResponseModel = try await service.post(
//                path: "/login",
//                reqBody: LoginData(email: email, password: password)
//            )
//            try service.saveAccessToken(token: result.accessToken)
//            state = .idle
//            store.update(result.accessToken)
//        } catch {
//            state = .failure(error.message)
//            print(error)
//        }
//    }
//    
//    func signup(_ store: AuthStore, firstname: String, lastname: String, email: String, password: String) async {
//        do {
//            state = .loading
//            let result: AuthResponseModel = try await service.post(
//                path: "/register",
//                reqBody: SignUpData(firstname: firstname, lastname: lastname, email: email, password: password)
//            )
//            try service.saveAccessToken(token: result.accessToken)
//            state = .idle
//            store.update(result.accessToken)
//        } catch {
//            state = .failure(error.message)
//            print(error)
//        }
//    }
//
//    func logout(_ store: AuthStore) {
//        try? service.deleteAccessToken()
//        store.update(nil)
//    }
//    
//    func checkToken(_ store: AuthStore) {
//        store.update(service.getAccessToken())
//    }
//}

struct LoginData: Encodable {
    var email: String
    var password: String
}

struct SignUpData: Encodable {
    var firstname: String
    var lastname: String
    var email: String
    var password: String
}
