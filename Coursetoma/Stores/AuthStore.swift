//
//  AuthStore.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 14/12/2024.
//

import SwiftUI

@Observable
class AuthStore {
    private(set) var token: String? = nil
    
    var isLoggedIn: Bool { token != nil }
    
    func update(_ token: String?) {
        self.token = token
    }
    
    func logout() {
        self.token = nil
    }
}

extension EnvironmentValues {
    @Entry var authStore = AuthStore()
}
