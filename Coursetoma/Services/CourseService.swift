//
//  CourseService.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 11/12/2024.
//

import SwiftUI

//@Observable
//class CourseService: ServiceStateManagable {
//    var state: ServiceState = .idle
//
//    @ObservationIgnored private let service: NetworkService
//    
//    init(_ service: NetworkService = NetworkServiceImpl.shared) {
//        self.service = service
//    }
//    
//    func fetchStudentCourses(_ store: CoursesStore) async {
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
//
//    func joinCourse(iv: String) async  {
//        do {
//            state = .loading
//            let path = "/course/\(iv)/join"
//            let _: VoidType? = try await service.post(path: path, reqBody: nil)
//            state = .success("You have requested to enrol in this course. You will be notified when an instructor accepts your request.")
//        } catch {
//            state = .failure(error.message)
//        }
//    }
//}

struct VoidType: Codable {
    let value: String?
}
