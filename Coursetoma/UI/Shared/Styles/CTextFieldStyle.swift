//
//  CTextFieldStyle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/01/2025.
//

import SwiftUI

struct CTextFieldStyle: ViewModifier {
    var isFocused: Bool
    var validityMessage: String?
    
    private var isInvalid: Bool { validityMessage != nil }
    
    var strokeColor: Color {
        if isInvalid { return .red }
        if isFocused { return .appPrimary }
        
        return .appGreyBorder
    }

    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
                .textFieldStyle(.plain)
                .font(.subheadline)
                .padding()
                .padding(.trailing)
                .scrollContentBackground(.hidden)
                .background(Color.appGreyContent)
                .clipShape(.rect(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(strokeColor, lineWidth: 1)
                }
                .overlay {
                    if isInvalid {
                        HStack {
                            Spacer()
                            Image(systemName: "info.circle")
                                .foregroundColor(.red)
                                .padding()
                        }
                    }else {
                        EmptyView()
                    }
                }
                .animation(.easeOut(duration: 0.26), value: isFocused)
            
            if isInvalid {
                Text(validityMessage!)
                    .font(.caption2)
                    .foregroundStyle(.red)
                    .transition(.scale)
                    
            }
        }
    }
}

extension View {
    func cTextFieldStyle(isFocused: Bool, validityMessage: String?) -> some View {
        self.modifier(CTextFieldStyle(isFocused: isFocused, validityMessage: validityMessage))
    }
}

#Preview {
    @Previewable @State var text: String = ""
    TextField("asdf", text: $text)
        .cTextFieldStyle(isFocused: true, validityMessage: nil)
        .padding()
}

struct InputValidator: ViewModifier {
    var inputType: String
    var text: String
    @Binding var errors: [String: Bool]
    @State var validator: (String) -> String?
    @State private var errorText: String? = nil
    
    func validate() {
        errorText = validator(text)
        if errorText == nil {
            errors[inputType] = false
        } else {
            errors[inputType] = true
        }
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: text) { _, newValue in
                validate()
            }
            .onAppear {
                errors[inputType] = true
            }
            .onSubmit(validate)
            .environment(\.inputInValidMessage, errorText)
    }
}

extension View {
    func validator(for inputType: String, with text: String, errors: Binding<[String: Bool]>, _ checker: @escaping (String) -> String?) -> some View {
        modifier(InputValidator(inputType: inputType, text: text, errors: errors, validator: checker))
    }
}

