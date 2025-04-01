//
//  CreateMaterialPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 31/03/2025.
//

import SwiftUI

struct CreateMaterialPage: View {
    @State private var title = ""
    @State private var description = ""
    @State private var showFilePicker = false
    @State private var selectedFilesURL = Set<URL>()
    @State private var quickLookURL: URL? = nil
    @Binding var isSheetOpen: Bool
    @FocusState var focusField: CreateMaterialFocusField?
    
    @State private var errors = [String: Bool]()

    var isValidTitle: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    CTextField(
                        label: "Title (required)",
                        hint: "e.g Some Title",
                        isFocused: focusField == .title,
                        text: $title
                    )
                    .focused($focusField, equals: .title)
                    .keyboardType(.default)
                    .submitLabel(.next)
                    .validator(for: "title", with: title, errors: $errors) { value in
                        value.isEmpty ? "Material title is required" : nil
                    }
                    .onSubmit { focusField = .description }
                    
                    CTextField(
                        type: .normal(3, true),
                        label: "Description",
                        hint: "e.g Some description",
                        isFocused: focusField == .description,
                        text: $description
                    )
                    .focused($focusField, equals: .description)
                    .keyboardType(.default)
                    .submitLabel(.return)
                    .onSubmit(submit)
                    
                    AttachmentPicker(
                        showFilePicker: $showFilePicker,
                        selectedFilesURL: $selectedFilesURL,
                        quickLookURL: $quickLookURL
                    )
                }
                .padding()
            }
            .scrollDismissesKeyboard(.automatic)
            .contentShape(Rectangle())
            .onTapGesture { focusField = nil }
            .navigationTitle("Create Material")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                Button("Post Material", action: submit)
                    .buttonStyle(.primaryStyle)
                    .safeAreaInsetStyle()
                    .environment(\.buttonDisabled, !isValidTitle)
            }
            .toolBarWithCloseButton(isSheetOpen: $isSheetOpen)
        }
        
    }
    
    func submit() {
        if !isValidTitle { return }
        print("submit comment: \(title)")
        title = ""
        focusField = nil
    }
    
    enum CreateMaterialFocusField {
        case title
        case description
    }
}

#Preview {
    CreateMaterialPage(isSheetOpen: .constant(true))
}
