//
//  JoinCoursePage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 24/03/2025.
//

import SwiftUI

struct JoinCoursePage: View {
    @State private var iv = ""
    @State private var errors = [String: Bool]()
    
    @FocusState private var fieldIsFocused: Bool

    var canSubmit: Bool { errors.allSatisfy { !$1 } }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Ask your teacher for the course IV, then enter it below.")
                .font(.callout.weight(.medium))
            
            CTextField(
                label: "Course IV (required)",
                hint: "e.g e0dsd1a",
                isFocused: fieldIsFocused,
                text: $iv
            )
            .keyboardType(.default)
            .submitLabel(.join)
            .focused($fieldIsFocused)
            .validator(for: "iv", with: iv, errors: $errors) { value in
                value.isEmpty ? "Enter course iv" : nil
            }
            .onSubmit(submit)
            
            Spacer()
            
            Button("Join Course", action: submit)
                .buttonStyle(.primaryStyle)
            
        }
        .onAppear { fieldIsFocused = true }
        .padding()
        .environment(\.buttonDisabled, !canSubmit)
        .navigationTitle("Join Course")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func submit() {
        if !canSubmit { return }
//        authStore.update(data.password)
    }
}

#Preview {
    NavigationStack {
        JoinCoursePage()
    }
}
