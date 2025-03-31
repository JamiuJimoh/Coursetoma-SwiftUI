//
//  Courses.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 15/02/2025.
//

import SwiftUI

struct CoursesPage: View {
    @Environment(\.navigator) private var navigator
    @Environment(\.authStore) private var authStore

    @State private var courseSectionHeight = 0.0
    @State private var showSheet = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    WelcomeSection()
                        .padding()
                    
                    CoursesSection()
                }
                .frame(minHeight: geometry.size.height)
            }
            .scrollIndicators(.hidden)
            .floatingActionButton {
                showSheet = true
            } label: {
                Image(systemName: "plus")
                    .floatingActionButtonStyle()
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Button("Create Course") {
                    showSheet = false
                    navigator.push(route: .createCourse)
                }
                .padding(.bottom, 8)
                
                Button("Join Course") {
                    showSheet = false
                    navigator.push(route: .joinCourse)
                }
            }
            .buttonStyle(.primaryStyle)
            .padding()
            .presentationDetents([.height(180)])
        }
    }
}

#Preview {
    CoursesPage()
}


