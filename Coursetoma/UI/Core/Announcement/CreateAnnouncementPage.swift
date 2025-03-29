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
                    
                    VStack {
                        HStack(spacing: 8) {
                            Text("Attachments")
                                .textFieldLabelStyle()
                            
                            Spacer()
                            
                            Button {
                                showFilePicker = true
                            } label: {
                                Image(systemName: "paperclip.circle")
                                    .foregroundStyle(.primary)
                                    .imageScale(.large)
                            }
                            .fileImporter(
                                isPresented: $showFilePicker,
                                allowedContentTypes: [.pdf, .image, .plainText, .text, .spreadsheet, .video ],
                                allowsMultipleSelection: true
                            ) { result in
                                do {
                                    let picked = Set(try result.get())
                                    selectedFilesURL.formUnion(picked)
                                } catch {
                                    //TODO: - Handle Error

                                    print("Error picking file: \(error.localizedDescription)")
                                }
                            }
                            
                        }
                        
                        if !selectedFilesURL.isEmpty {
                            HStack {
                                ForEach(Array(selectedFilesURL), id: \.absoluteString) { url in
                                    AttachmentTile(
                                        attachment: Attachment(
                                            id: url.absoluteString,
                                            url: url,
                                            type: Attachment.getFileType(for: url),
                                            createdAt: Date()
                                        )
                                    )
                                    .onTapGesture { quickLookURL = url }
                                    .quickLookPreview($quickLookURL)
                                }
                                Spacer()
                            }

                        }
                    }
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
    CreateAnnouncementPage()
}
