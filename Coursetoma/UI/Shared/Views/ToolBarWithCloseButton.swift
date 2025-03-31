//
//  ToolBarWithCloseButton.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/03/2025.
//

import SwiftUI

struct ToolBarWithCloseButton: ViewModifier {
    @Binding var isSheetOpen: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetOpen = false
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            }
    }
}

extension View {
    func toolBarWithCloseButton(isSheetOpen: Binding<Bool>) -> some View {
        modifier(ToolBarWithCloseButton(isSheetOpen: isSheetOpen))
    }
}
