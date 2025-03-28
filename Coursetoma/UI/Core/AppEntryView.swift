//
//  AppEntryView.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/12/2024.
//

import SwiftUI

struct AppEntryView: View {
    @Environment(\.authStore) private var authStore
    @Environment(\.navigator) private var navigator
    
    var body: some View {
        @Bindable var navigator = navigator

        NavigationStack(path: $navigator.path) {
            Group {
                if authStore.isLoggedIn {
                    HomeTabPage()
                } else {
                    OnboardingPage()
                }
            }
            .onChange(of: authStore.isLoggedIn) { _, _ in
                navigator.reset()
            }
            .navigationDestination(for: NavigationStore.Route.self) { $0.destination }
        }
//        .task {
//            authService.checkToken(authStore)
//        }
    }
}

#Preview {
    AppEntryView()
}
