//
//  AttachmentPicker.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/04/2025.
//

import SwiftUI

struct AttachmentPicker: View {
    @Binding var showFilePicker: Bool
    @Binding var selectedFilesURL: Set<URL>
    @Binding var quickLookURL: URL? 
    
    var body: some View {
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
}

#Preview {
    AttachmentPicker(showFilePicker: .constant(false), selectedFilesURL: .constant(Set<URL>()), quickLookURL: .constant(nil))
}
