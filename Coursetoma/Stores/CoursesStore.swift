//
//  CoursesStore.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 10/12/2024.
//

import Foundation

@Observable
class CoursesStore {
    private(set) var studentCourses: [StudentCourse]? = nil
    private(set) var instructorCourses: [InstructorCourse]? = nil
    
    func update(_ studentCourses: [StudentCourse]) {
        self.studentCourses = studentCourses
    }
    
    func update(_ instructorCourses: [InstructorCourse]) {
        self.instructorCourses = instructorCourses
    }
}
