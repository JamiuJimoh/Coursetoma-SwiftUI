//
//  FloatingActionButton.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 31/03/2025.
//

import SwiftUI

struct FloatingActionButton<Label: View>: ViewModifier {
    var action: () -> Void
    @ViewBuilder var label: () -> Label

    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    
                    Button(action: action, label: label)
                }
                .padding()
//                .padding(.trailingvoiceover)
            }
    }
}

extension View {
    func floatingActionButton<Label: View>(_ action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) -> some View {
        modifier(FloatingActionButton(action: action, label: label))
    }
}
