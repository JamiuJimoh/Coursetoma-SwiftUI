//
//  CreateAnnouncementPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI
import QuickLook

struct CreateAnnouncementPage: View {
    @State private var text = ""
    @State private var showFilePicker = false
    @State private var selectedFilesURL = Set<URL>()
    @State private var quickLookURL: URL? = nil
    @Binding var isSheetOpen: Bool

    @FocusState private var fieldIsFocused: Bool

    var isValidText: Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    CTextField(
                        type: .normal(6, false),
                        label: "Message",
                        hint: "Add announcement message",
                        isFocused: fieldIsFocused,
                        text: $text
                    )
                    .focused($fieldIsFocused)
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
            .onTapGesture { fieldIsFocused = false }
            .navigationTitle("Create Announcement")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                Button("Create Announcement") {
                    
                }
                .buttonStyle(.primaryStyle)
                .safeAreaInsetStyle()
                .environment(\.buttonDisabled, !isValidText)
            }
            .toolBarWithCloseButton()
        }
        
    }
    
    func submit() {
        if !isValidText { return }
        print("submit comment: \(text)")
        text = ""
        fieldIsFocused = false
    }
}

#Preview {
    CreateAnnouncementPage(isSheetOpen: .constant(true))
}
