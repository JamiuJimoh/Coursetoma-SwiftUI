//
//  HomeTabPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 10/02/2025.
//

import SwiftUI

struct HomeTabPage: View {
    var body: some View {
        TabView {
            Tab("Courses", systemImage: "book") {
                CoursesPage()
            }

            Tab("Notification", systemImage: "bell") {
                NotificationsPage()
            }
            
            Tab("profile", systemImage: "person") {
                ProfilePage()
            }
        }
        .symbolVariant(.none)
    }
}

#Preview {
    HomeTabPage()
}
