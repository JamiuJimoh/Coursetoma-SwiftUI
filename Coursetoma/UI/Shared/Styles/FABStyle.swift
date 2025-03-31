//
//  FABStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 31/03/2025.
//

import SwiftUI

struct FABStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .medium))
            .foregroundStyle(.white)
            .padding()
            .background(.primary)
            .clipShape(.circle)
            .shadow(color: Color.black.opacity(0.25), radius: 5.74, x: 0, y: 5.74)
    }
}

extension View {
    func floatingActionButtonStyle() -> some View {
        modifier(FABStyle())
    }
}
