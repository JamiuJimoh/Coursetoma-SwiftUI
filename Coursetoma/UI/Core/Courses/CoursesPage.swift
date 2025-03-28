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
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    Button {
                        showSheet = true
                    }label: {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundStyle(.white)
                            .padding()
                            .background(.primary)
                            .clipShape(.circle)
                            .shadow(color: Color.black.opacity(0.25), radius: 5.74, x: 0, y: 5.74)
                    }
                }
                .padding()
                .padding(.trailing, 24)
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


