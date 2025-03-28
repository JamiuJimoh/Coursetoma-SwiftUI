//
//  CommentsPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct CommentsPage: View {
    var announcementID: String
    
    @State private var newComment: String = ""
    @FocusState private var fieldIsFocused: Bool

    @Binding var showComments: Bool
    
    var isValidComment: Bool {
        !newComment.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(Comment.mockComments) { comment in
                        CommentTile(comment: comment)
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showComments = false
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack(alignment: .bottom, spacing: 8) {
                    CTextField(
                        type: .normal(3, false),
                        label: "",
                        hint: "Add a comment",
                        isFocused: fieldIsFocused,
                        text: $newComment
                    )
                    .focused($fieldIsFocused)
                    .keyboardType(.default)
                    .submitLabel(.return)
                    .onSubmit(submit)
                    .transition(.slide.animation(.easeInOut(duration: 2)))

                    if isValidComment {
                        Button {
                            submit()
                        } label: {
                            Image(systemName: "paperplane")
                                .padding()
                                .background(.appPrimaryFeint)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .animation(.smooth(duration: 0.3), value: newComment)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .background(.background)
            }
            .scrollDismissesKeyboard(.automatic)
            .contentShape(Rectangle())
            .onTapGesture { fieldIsFocused = false }
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    func submit() {
        if !isValidComment { return }
        print("submit comment: \(newComment)")
        newComment = ""
        fieldIsFocused = false
    }
}

#Preview {
    CommentsPage(announcementID: "id", showComments: .constant(true))
}
