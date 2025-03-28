//
//  BorderedContainerStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 26/03/2025.
//

import SwiftUI

struct BorderedContainerStyle: ViewModifier {
    var color: Color
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .fill(.appGreyBorder)
            }
    }
}

extension View {
    func borderedContainerStyle(_ color: Color = .appGreyBorder, cornerRadius: CGFloat = 8) -> some View {
        modifier(BorderedContainerStyle(color: color, cornerRadius: cornerRadius))
    }
}
