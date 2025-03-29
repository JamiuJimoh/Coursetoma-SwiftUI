//
//  SafeAreaInsetStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct SafeAreaInsetStyle: ViewModifier {
    var verticalPadding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.vertical, verticalPadding)
            .background(.background)
    }
}

extension View {
    func safeAreaInsetStyle(_ verticalPadding: CGFloat = 4) -> some View {
        modifier(SafeAreaInsetStyle(verticalPadding: verticalPadding))
    }
}
