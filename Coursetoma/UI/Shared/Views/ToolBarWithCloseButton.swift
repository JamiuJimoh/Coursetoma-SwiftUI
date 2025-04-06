//
//  ToolBarWithCloseButton.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/03/2025.
//

import SwiftUI

struct ToolBarWithCloseButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(title, role: .cancel) {
                        dismiss()
                    }
                }
            }
    }
}

extension View {
    func toolBarWithCloseButton(title: String = "Close") -> some View {
        modifier(ToolBarWithCloseButton(title: title))
    }
}
