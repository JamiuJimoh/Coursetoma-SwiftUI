//
//  PeoplePage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 25/03/2025.
//

import SwiftUI

struct PeoplePage: View {
    @State private var viewType: PeopleViewType = .instructors
    
    var course: any Course
    
    var body: some View {
        Group {
            switch viewType {
            case .instructors: InstructorsPage(courseID: course.id)
            case .students: StudentsPage(courseID: course.id)
            }
        }
        .transition(.blurReplace)
        .floatingActionButton {
            withAnimation(.smooth(duration: 0.26)) {
                viewType.toggle()
            }
        } label: {
            Image(systemName: "person.and.arrow.left.and.arrow.right.outward")
                .floatingActionButtonStyle()
        }
        
    }
    
    enum PeopleViewType {
        case instructors
        case students
        
        mutating func toggle() {
            self = self == .instructors ? .students : .instructors
        }
    }
}

#Preview {
    PeoplePage(course: StudentCourse.mock[0])
}
