//
//  DividerStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 31/03/2025.
//

import SwiftUI

struct DividerStyle: ViewModifier {
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(height: height)
            .overlay(.appGreyBorder)
    }
}

extension View {
    func dividerStyle(_ height: CGFloat = 1) -> some View {
        modifier(DividerStyle(height: height))
    }
}
