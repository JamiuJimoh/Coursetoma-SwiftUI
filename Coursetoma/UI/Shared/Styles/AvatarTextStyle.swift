//
//  AvatarTextStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 15/02/2025.
//

import SwiftUI

struct AvatarTextStyle: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size * 0.37, weight: .medium, design: .monospaced))
    }
}

extension View {
    func avatarTextStyle(_ size: CGFloat) -> some View {
        modifier(AvatarTextStyle(size: size))
    }
}
