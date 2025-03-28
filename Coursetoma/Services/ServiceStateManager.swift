//
//  ServiceStateManager.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/12/2024.
//

import SwiftUI

protocol ServiceStateManagable {
    var state: ServiceState { get set }
    var isLoading: Bool { get }
    
    var errorMessage: String? { get }
    var successMessage: String? { get }

    var hasError: Bool { get set }
    var isSuccessful: Bool { get set }
}

enum ServiceState {
    case idle
    case loading
    case success(String?)
    case failure(String = "An error occurred.")

    static func == (lhs: ServiceState, rhs: ServiceState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.success, .success), (.failure, .failure):
            return true
        default:
            return false
        }
    }
     var isLoading: Bool {
        self == .loading
    }
    
    var errorMessage: String? {
        if case .failure(let message) = self {
            return message
        }
        return nil
    }
    
    var successMessage: String? {
        if case .success(let message) = self {
            return message
        }
        return nil
    }
}


extension ServiceStateManagable {
    var isLoading: Bool {
        state.isLoading
    }
    
    var errorMessage: String? {
        state.errorMessage
    }
    
    var successMessage: String? {
        state.successMessage
    }
    
    var hasError: Bool {
        get {
            state.errorMessage != nil
        }
        set {
            if !newValue {
                state = .idle
            }
        }
    }
    
    var isSuccessful: Bool {
        get {
            state.successMessage != nil
        }
        set {
            if !newValue {
                state = .idle
            }
        }
    }
    
}
