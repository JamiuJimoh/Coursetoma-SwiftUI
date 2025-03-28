//
//  ButtonStyles.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/01/2025.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
        @Environment(\.buttonDisabled) private var buttonDisabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
//                .appPrimary.opacity(configuration.isPressed || buttonDisabled ? 0.5 : 1)
                .appPrimary.mix(with: Color.white, by: configuration.isPressed || buttonDisabled ? 0.5 : 0)
            )
            .clipShape(.rect(cornerRadius: 8))
            .scaleEffect(configuration.isPressed && !buttonDisabled ? 1.015 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .disabled(buttonDisabled)
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primaryStyle: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}
