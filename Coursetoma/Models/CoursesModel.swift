//
//  CoursesModel.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 06/12/2024.
//

import Foundation

enum CourseRole: String {
    case student
    case instructor
}

enum CoursesDataRole: Codable, Equatable {
    static func == (lhs: CoursesDataRole, rhs: CoursesDataRole) -> Bool {
        switch (lhs, rhs) {
        case (.student, .student): return true
        case (.instructor, .instructor): return true
        default: return false
        }
    }
    
    case student([StudentCourse])
    case instructor([InstructorCourse])
    
    var studentCourses: [StudentCourse] {
        switch self {
        case .student(let courses): return courses
        case .instructor(_): return []
        }
    }
    
    var instructorCourses: [InstructorCourse] {
        switch self {
        case .student(_): return []
        case .instructor(let courses): return courses
        }
    }
}

//@Observable
//class CoursesModel {
////    var state: ServiceState = ServiceState.idle
//    var data: CoursesDataRole? = nil
//    var successMessage: String? = nil
//
//    @ObservationIgnored let service: NetworkService
//    
//    init(_ service: NetworkService = NetworkServiceImpl.shared) {
//        self.service = service
//        Task {
//            try? await fetchCourses(as: .instructor)
//        }
//    }
//    
//    func fetchCourses(as role: CourseRole) async throws {
////            self.state = .loading
//            let path = "/courses?role=\(role)"
//            switch role {
//            case .instructor:
//                let instructorCourses: [InstructorCourse] = try await service.get(path: path)
////                self.state = .idle
//                self.data = .instructor(instructorCourses)
//            case .student:
//                let studentCourses: [StudentCourse] = try await service.get(path: path)
////                self.state = .idle
//                self.data = .student(studentCourses)
//            }
//    }
//    
//    func createCourse(title: String, description: String, code: String) async  {
//        do {
////            state = .loading
//            let path = "/courses"
//            let course: Course = try await service.post(
//                path: path,
//                reqBody: CreateCourseModel(
//                    title: title,
//                    description: description,
//                    code: code
//                )
//            )
////            state = .idle
////            successMessage = "\(course.title) created successfully!"
//            print(course)
//        } catch {
////            state = .failure(error.message)
//            print(error)
//        }
//    }
//
//}

//extension CoursesModel: ServiceStateManagable {
//    var isLoading: Bool { state.isLoading }
//    
//    var errorMessage: String? { state.unwrappedErrorMessage }
//    
//    var hasError: Bool {
//        get { state.hasError }
//        set {}
//    }
//    
//    var hasSuccessMessage: Bool {
//        get { successMessage != nil }
//        set {}
//    }
//}

struct CreateCourseModel: Encodable {
    let title: String
    let description: String
    let code: String
}
