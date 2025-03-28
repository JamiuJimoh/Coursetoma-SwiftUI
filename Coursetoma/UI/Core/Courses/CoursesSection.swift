//
//  CoursesSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 15/02/2025.
//

import SwiftUI

struct CoursesSection: View {
    @Environment(\.navigator) private var navigator
    
    @State private var selectedTab: CourseType = .teaching
    @State private var studentCourses = [StudentCourse]()
    @State private var instructorCourses = [InstructorCourse]()

    var body: some View {
        VStack {
            SwipablePageTabView(selectedTab: $selectedTab) { tab in
                Group {
                    switch tab {
                    case .teaching:
                        List(instructorCourses) { course in
                            CourseTile(course: course)
                                .listRowSeparator(.hidden)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    navigator.push(route: .classroom(course))
                                }
                        }
                    case .enrolled:
                        List(studentCourses) { course in
                            CourseTile(course: course)
                                .listRowSeparator(.hidden)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    navigator.push(route: .classroom(course))
                                }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onChange(of: selectedTab) { _, newValue in
                fetchCourse(type: newValue)
            }
        }
        .task {
            fetchCourse(type: selectedTab)
        }
    }
    
    func fetchCourse(type: CourseType) {
        if case .teaching = type {
            instructorCourses = InstructorCourse.mock
        } else {
            studentCourses = StudentCourse.mock
        }
    }
    
    enum CourseType: String, SwipablePageEnumConstraints {
        case teaching
        case enrolled
        
        var id: String { self.rawValue }
    }
}

#Preview {
    CoursesSection()
}
