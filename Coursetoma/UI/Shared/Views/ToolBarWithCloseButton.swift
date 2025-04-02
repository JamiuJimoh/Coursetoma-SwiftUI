//
//  ToolBarWithCloseButton.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/03/2025.
//

import SwiftUI

struct ToolBarWithCloseButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            }
    }
}

extension View {
    func toolBarWithCloseButton() -> some View {
        modifier(ToolBarWithCloseButton())
    }
}
