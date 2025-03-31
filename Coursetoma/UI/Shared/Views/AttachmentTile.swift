//
//  AttachmentTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/03/2025.
//

import SwiftUI

struct AttachmentTile: View {
    let attachment: Attachment
    
    var title: String {
        if attachment.type == .link {
            return attachment.url.absoluteString
        }
        return attachment.url.lastPathComponent
    }
    
    var body: some View {
        HStack(spacing: 8) {
            attachment.image
                .foregroundStyle(.appPrimary)
            
            Group {
                if case attachment.type = .link {
                    Link(attachment.url.absoluteString, destination: attachment.url)
                } else {
                    Text(attachment.url.lastPathComponent)
                }
            }
            .font(.footnote.weight(.medium))
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 10)
        .borderedContainerStyle(cornerRadius: 16)
    }
}

#Preview {
    AttachmentTile(attachment: Attachment.mockAttachments[2])
}
