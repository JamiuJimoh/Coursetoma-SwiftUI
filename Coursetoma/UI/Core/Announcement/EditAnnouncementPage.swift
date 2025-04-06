//
//  EditAnnouncementPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI
import QuickLook

struct EditAnnouncementPage: View {
    @State private var text = ""
    @State private var showFilePicker = false
    @State private var selectedFilesURL = Set<URL>()
    @State private var quickLookURL: URL? = nil
    
    var announcement: Announcement?
    @Binding var isSheetOpen: Bool

    @FocusState private var fieldIsFocused: Bool

    var isValidText: Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var pageTitle: String {
        if announcement == nil {
            return "Create Announcement"
        }
        return "Edit Announcement"
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
            .navigationTitle(pageTitle)
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                Button(pageTitle) {
                    
                }
                .buttonStyle(.primaryStyle)
                .safeAreaInsetStyle()
                .environment(\.buttonDisabled, !isValidText)
            }
            .onAppear { text = announcement?.message ?? "" }
            .toolBarWithCloseButton(title: "Cancel")
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
    EditAnnouncementPage(isSheetOpen: .constant(true))
}
