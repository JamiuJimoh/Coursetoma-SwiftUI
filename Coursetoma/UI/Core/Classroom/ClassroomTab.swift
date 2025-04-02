//
//  ClassroomTab.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 25/03/2025.
//

import SwiftUI

struct ClassroomTab: View {
    @State private var selectedTab: ClassroomTabType = .stream
    
    var course: any Course

    var body: some View {
        VStack {
            SwipablePageTabView(selectedTab: $selectedTab) { tab in
                Group {
                    switch tab {
                    case .stream:
                        StreamPage(course: course)
                            .listRowSeparator(.hidden)
                    case .materials:
                        MaterialsPage(courseID: course.id)
                            .listRowSeparator(.hidden)
                    case .people:
                        PeoplePage(course: course)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
            .onChange(of: selectedTab) { _, newValue in
            }
        }
//        .navigationBarBackButtonHidden()
        .task {
        }
    }
    
    enum ClassroomTabType: String, SwipablePageEnumConstraints {
        case stream
        case materials
        case people

        var id: String { self.rawValue }
    }
}

#Preview {
    NavigationStack {
        ClassroomTab(course: StudentCourse.mock[0])
    }
}
