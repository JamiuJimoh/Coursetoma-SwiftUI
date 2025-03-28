//
//  CourseDetailsService.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 18/12/2024.
//

import SwiftUI

//@Observable
//class CourseDetailsService: ServiceStateManagable {
//    var state: ServiceState = .idle
//    
//    var students: [StudentCourse]?
//    var instructors: [InstructorCourse]?
//
//    @ObservationIgnored private let service: NetworkService
//    
//    init(_ service: NetworkService = NetworkServiceImpl.shared) {
//        self.service = service
//    }
//    
//    func fetchCourseStudents(_ store: CoursesStore) async {
//        //courses/0193c1d5-3bce-7683-b2fd-d69f17e48188/instructors?start=1&size=/
//        do {
//            state = .loading
//            let path = "/courses?role=student"
//            let studentCourses: [StudentCourse] = try await service.get(path: path)
//            store.update(studentCourses)
//            state = .success(nil)
//        } catch {
//            state = .failure(error.message)
//        }
//    }
//    
//    func fetchInstructorCourses(_ store: CoursesStore) async {
//        do {
//            state = .loading
//            let path = "/courses?role=instructor"
//            let instructorCourses: [InstructorCourse] = try await service.get(path: path)
//            store.update(instructorCourses)
//            state = .success(nil)
//        } catch {
//            state = .failure(error.message)
//        }
//        print(state)
//    }
//    
//    func createCourse(title: String, description: String, code: String) async  {
//        do {
//            state = .loading
//            let path = "/courses"
//            let course: Course! = try await service.post(
//                path: path,
//                reqBody: CreateCourseModel(
//                    title: title,
//                    description: description,
//                    code: code
//                )
//            )
//            state = .success("\(course.title) created successfully!")
//            print(course)
//        } catch {
//            state = .failure(error.message)
//        }
//    }
//}

