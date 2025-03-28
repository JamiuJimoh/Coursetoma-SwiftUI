//
//  AuthModel.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/11/2024.
//

import Foundation

//
//@Observable
//class AuthModel: ServiceStateManagable {
//    var state: ServiceState = ServiceState.idle
//    var data: String? = nil
//
//    @ObservationIgnored let service: NetworkService
//
//    init(_ service: NetworkService = NetworkServiceImpl.shared) {
//        self.service = service
//        _checkToken()
//    }
//   
//    func login(email: String, password: String) async {
//        do {
//            self.state = .loading
//            let result: AuthResponseModel = try await service.post(
//                path: "/login",
//                reqBody: LoginData(email: email, password: password)
//            )
//            try service.saveAccessToken(token: result.accessToken)
//            state = .idle
//            data = result.accessToken
//        } catch {
//            state = .failure(error.message)
//            print(error)
//        }
//    }
//    
//    func signup(firstname: String, lastname: String, email: String, password: String) async {
//        do {
//            state = .loading
//            let result: AuthResponseModel = try await service.post(
//                path: "/register",
//                reqBody: SignUpData(firstname: firstname, lastname: lastname, email: email, password: password)
//            )
//            try service.saveAccessToken(token: result.accessToken)
//            state = .idle
//            data = result.accessToken
//        } catch {
//            state = .failure(error.message)
//            print(error)
//        }
//    }
//
//    func logout() {
//        try? service.deleteAccessToken()
//        data = nil
//    }
//    
//    func _checkToken() {
//        data = service.getAccessToken()
//    }
//}
//
////extension AuthModel: ServiceStateManagable {
////extension AuthModel {
////    var isLoading: Bool { state == .loading }
////    
////    var errorMessage: String? { "" }
////    
////    var hasError: Bool {
//////        get { state ==  }
////        get { false }
////        set {}
////    }
////    
////}
//
//struct LoginData: Encodable {
//    var email: String
//    var password: String
//}
//
//struct SignUpData: Encodable {
//    var firstname: String
//    var lastname: String
//    var email: String
//    var password: String
//}
