//
//  LoginPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/01/2025.
//

import SwiftUI

struct LoginPage: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.authStore) private var authStore
    @State private var data = LoginData()
    @FocusState var focusField: LoginFocusField?

    var body: some View {
        VStack(spacing: 24) {
            Text("Welcome back!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
            
            CTextField(
                label: "Email",
                hint: "Enter your email",
                isFocused: focusField == .email,
                text: $data.email
            )
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .submitLabel(.next)
            .focused($focusField, equals: .email)
            .validator(for: "email", with: data.email, errors: $data.errors) { value in
                value.isEmpty ? "Email is required" : nil
            }
            .onSubmit { focusField = .password }
            
            CTextField(
                type: .secure,
                label: "Password",
                hint: "Enter password",
                isFocused: focusField == .password,
                text: $data.password
            )
            .textContentType(.password)
            .submitLabel(.send)
            .focused($focusField, equals: .password)
            .validator(for: "password", with: data.password, errors: $data.errors) { value in
                value.isEmpty ? "Password is required" : nil
            }
            .onSubmit(submit)
            
            Spacer()
            
            Button("Login", action: submit)
                .buttonStyle(.primaryStyle)
            
            ClickableDoubleTextView(LText: "Don't have an account?", RText: "Register") {
                navigator.pushReplacement(route: .signup)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture { focusField = nil }
        .environment(\.buttonDisabled, !data.canSubmit)
        .padding([.leading, .trailing, .bottom])
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func submit() {
        if !data.canSubmit { return }
        authStore.update(data.password)
    }
    
    struct LoginData {
        var email = ""
        var password = ""
        var errors = [String: Bool]()
        
        var canSubmit: Bool { errors.allSatisfy { !$1 } }
    }
    
    enum LoginFocusField {
        case email
        case password
    }
}

#Preview {
    LoginPage()
}

