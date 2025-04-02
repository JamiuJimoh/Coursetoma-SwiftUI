//
//  InvitePersonPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 02/04/2025.
//

import SwiftUI

struct InvitePersonPage: View {
    @State private var email = ""
    @State private var errors = [String: Bool]()
    
    @FocusState private var fieldIsFocused: Bool
    
    var inviteType: InviteType

    var canSubmit: Bool { errors.allSatisfy { !$1 } }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("An invite link will be sent to the user with this email address.")
                    .font(.callout.weight(.medium))
                
                CTextField(
                    label: "Email (required)",
                    hint: "e.g john@doe.com",
                    isFocused: fieldIsFocused,
                    text: $email
                )
                .keyboardType(.default)
                .submitLabel(.send)
                .focused($fieldIsFocused)
                .validator(for: "email", with: email, errors: $errors) { value in
                    value.isEmpty ? "Enter \(inviteType.rawValue)'s email" : nil
                }
                .onSubmit(submit)
                
                Spacer()
                
                Button("Send Invite", action: submit)
                    .buttonStyle(.primaryStyle)
                
            }
            .toolBarWithCloseButton()
            .onAppear { fieldIsFocused = true }
            .padding()
            .environment(\.buttonDisabled, !canSubmit)
            .navigationTitle("Invite \(inviteType.rawValue.capitalized)")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func submit() {
        if !canSubmit { return }
    }
    
    enum InviteType: String {
        case instructor
        case student
    }
}

#Preview {
    NavigationStack {
        InvitePersonPage(inviteType: .instructor)
    }
}
