//
//  CoursetomaApp.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 29/11/2024.
//

import SwiftUI

@main
struct CoursetomaApp: App {
    var body: some Scene {
        WindowGroup {
            AppEntryView()
                .environment(\.navigator, NavigationStore())
                .environment(\.authStore, AuthStore())
        }
    }
}

extension EnvironmentValues {
    @Entry var coursesStore = CoursesStore()
    @Entry var inputInValidMessage: String? = nil
    @Entry var buttonDisabled = false
    @Entry var seenOnboarding = false
}
