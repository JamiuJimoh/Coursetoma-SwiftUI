//
//  OnboardingBottomSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/01/2025.
//

import SwiftUI

struct OnboardingBottomSection: View {
    @Environment(\.navigator) private var navigator
    @Binding var currentIndex: Int

    var isLastItem: Bool {
        currentIndex == OnboardingData.all.endIndex - 1
    }

    var body: some View {
        VStack {
            Button(isLastItem ? "Create an account" : "Get Started") {
                navigator.push(route: .signup)
            }
            .buttonStyle(.primaryStyle)
            .padding([.top, .bottom], 16)
            
            Group {
                if !isLastItem {
                    Button("Skip") {
                        currentIndex = OnboardingData.all.endIndex - 1
                    }
                    .font(.headline)
                    .tint(.primary)
                } else {
                    ClickableDoubleTextView(LText: "Already have an account?", RText: "Log in") {
                        navigator.pushReplacement(route: .login)
                    }
                }
            }
            .frame(height: 25)
            .padding(.bottom, 32)
            
            HStack(spacing: 4) {
                ForEach(OnboardingData.all.indices, id: \.self) { index in
                    Color(currentIndex == index ? .appPrimary : .appPrimaryFeint)
                        .frame(width: 15, height: 4)
                        .clipShape(.rect(cornerRadius: 4))
                        .animation(.easeOut, value: currentIndex)
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    OnboardingBottomSection(currentIndex: .constant(0))
}
