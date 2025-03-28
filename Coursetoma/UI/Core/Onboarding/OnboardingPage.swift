//
//  OnboardingPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 19/01/2025.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var currentIndex = 0

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(OnboardingData.all) { data in
                OnboardingPageItem(data: data)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .safeAreaInset(edge: .bottom) {
            OnboardingBottomSection(currentIndex: $currentIndex)
        }
    }
}

#Preview {
    OnboardingPage()
}
