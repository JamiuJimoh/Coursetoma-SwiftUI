//
//  CTextField.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/01/2025.
//

import SwiftUI

struct CTextField: View {
    @Environment(\.inputInValidMessage) private var validityMessage
    var type: TextFieldType = .normal()
    var label: String
    var hint: String
    var isFocused: Bool = false

    @Binding var text: String
    
    var isInvalid: Bool {
        return validityMessage != nil
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.footnote.weight(.medium))
            Group {
                switch type {
                case .normal(let lineLimit, let reservesSpace):
                    TextField(hint, text: $text, axis: lineLimit > 1 ? .vertical : .horizontal)
                        .lineLimit(lineLimit, reservesSpace: reservesSpace)
                case .editor(let height):
                    TextEditor(text: $text)
                        .frame(height: height)
                case .secure:
                    SecureField(hint, text: $text)
                }
            }
            .cTextFieldStyle(isFocused: isFocused, validityMessage: validityMessage)
        }
    }
    
    enum TextFieldType {
        case editor(CGFloat)
        case normal(Int = 1, Bool = true)
        case secure
    }
}

#Preview {
    Group {
        CTextField(label: "Email", hint: "Enter email address", text: .constant(""))
        CTextField(type: .editor(72), label: "Email", hint: "Enter email address", text: .constant(""))
    }
    .padding()
}
