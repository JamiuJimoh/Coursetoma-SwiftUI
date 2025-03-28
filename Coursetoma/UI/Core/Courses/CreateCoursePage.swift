//
//  CreateCoursePage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 24/03/2025.
//

import SwiftUI
import PhotosUI

struct CreateCoursePage: View {
    @State private var data = CreateCourseData()
    @FocusState var focusField: CreateCourseFocusField?

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                CourseBannerSection()
                
                //MARK: - Form Section
                Group {
                    CTextField(
                        label: "Course Code",
                        hint: "e.g ML404",
                        isFocused: focusField == .code,
                        text: $data.code
                    )
                    .keyboardType(.default)
                    .submitLabel(.next)
                    .focused($focusField, equals: .code)
                    .onSubmit { focusField = .title }

                    CTextField(
                        label: "Course Title (required)",
                        hint: "e.g Machine Learning",
                        isFocused: focusField == .title,
                        text: $data.title
                    )
                    .keyboardType(.default)
                    .submitLabel(.next)
                    .focused($focusField, equals: .title)
                    .validator(for: "title", with: data.title, errors: $data.errors) { value in
                        value.isEmpty ? "Course title is required" : nil
                    }
                    .onSubmit { focusField = .description }
                    
                    CTextField(
                        type: .normal(4),
                        label: "Description",
                        hint: "e.g Get introduced to machine learning concepts.",
                        isFocused: focusField == .description,
                        text: $data.description
                    )
                    .keyboardType(.default)
                    .submitLabel(.return)
                    .focused($focusField, equals: .description)
                    .onSubmit(submit)
                }
                
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .contentShape(Rectangle())
        .onTapGesture { focusField = nil }
        .safeAreaInset(edge: .bottom, spacing: 48) {
            Button("Create Course", action: submit)
                .buttonStyle(.primaryStyle)
//                .padding(.top, 24)
        }
        .padding()
        .environment(\.buttonDisabled, !data.canSubmit)
        .navigationTitle("Create Course")
        .navigationBarTitleDisplayMode(.inline)
    }

    func submit() {
        if !data.canSubmit { return }
//        authStore.update(data.password)
    }

    struct CreateCourseData {
        var banner = ""
        var code = ""
        var title = ""
        var description = ""
        var errors = [String: Bool]()
        
        var canSubmit: Bool { errors.allSatisfy { !$1 } }
    }
    
    enum CreateCourseFocusField {
        case banner
        case code
        case title
        case description
    }
}

#Preview {
    NavigationStack {
        CreateCoursePage()
    }
}
