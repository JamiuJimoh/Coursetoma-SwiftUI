//
//  TextFieldLabelStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct TextFieldLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote.weight(.medium))
    }
}

extension View {
    func textFieldLabelStyle() -> some View {
        modifier(TextFieldLabelStyle())
    }
}
