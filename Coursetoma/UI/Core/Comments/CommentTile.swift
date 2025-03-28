//
//  CommentTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct CommentTile: View {
    var comment: Comment
    
    var creator: User { comment.creator }
    
    var body: some View {
        HStack(spacing: 8.0) {
            ProfileAvatarCircle(size: 38, avatarURL: creator.avatarURL, initials: creator.initials)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(creator.fullname)
                        .font(.subheadline.weight(.medium))
                    Text(comment.createdAt.formatted(.dateTime.day().month(.abbreviated).year().hour().minute()))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Text(comment.text)
                    .font(.footnote)
            }
            Spacer()
            
            if creator == .mockCurrentUser {
                Image(systemName: "ellipsis")
                    .onTapGesture {
                        //TODO: - Make this clickable to "more" context
                        print("More option")
                    }
                
            }
        }
        .padding([.horizontal, .vertical], 10)
        .borderedContainerStyle()
    }
}

#Preview {
    CommentTile(comment: Comment.mockComments[0])
        .padding()
}
