//
//  SignupPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/01/2025.
//

import SwiftUI

struct SignupPage: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.authStore) private var authStore
    @State private var data = SignupData()
    @FocusState var focusField: SignupFocusField?

    var body: some View {
        ScrollView{
            VStack(spacing: 24) {
                Text("Create an account")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)

                CTextField(
                    label: "Full name",
                    hint: "Enter your full name",
                    isFocused: focusField == .fullname,
                    text: $data.fullname
                )
                .keyboardType(.namePhonePad)
                .textContentType(.name)
                .submitLabel(.next)
                .focused($focusField, equals: .fullname)
                .validator(for: "fullname", with: data.fullname, errors: $data.errors) { value in
                    value.isEmpty ? "Full name is required" : nil
                }
                .onSubmit { focusField = .email }

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
                
                
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .contentShape(Rectangle())
        .onTapGesture { focusField = nil }
        .safeAreaInset(edge: .bottom, spacing: 48) {
            VStack(spacing: 24) {
                Button("Signup", action: submit)
                    .buttonStyle(.primaryStyle)
                
                ClickableDoubleTextView(LText: "Already have an account?", RText: "Login") {
                    navigator.pushReplacement(route: .login)
                }
                
            }
        }
        .environment(\.buttonDisabled, !data.canSubmit)
        .padding([.leading, .trailing, .bottom])
        .navigationTitle("Signup")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func submit() {
        if !data.canSubmit { return }
        authStore.update("adf")
    }
    
    struct SignupData {
        var fullname = ""
        var email = ""
        var password = ""
        var errors = [String: Bool]()
        
        var canSubmit: Bool { errors.allSatisfy { !$1 } }
    }
    
    enum SignupFocusField {
        case fullname
        case email
        case password
    }
}

#Preview {
    SignupPage()
}
