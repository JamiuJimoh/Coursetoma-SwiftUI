//
//  NavigationStore.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 27/01/2025.
//

import SwiftUI

@Observable
class NavigationStore {
    
    var path = NavigationPath()
    
    func reset() {
        path = NavigationPath()
    }
    
    func push(route: Route) {
        path.append(route)
    }
    
    func pushReplacement(route: Route) {
        if !path.isEmpty {
            path.removeLast()
        }
        path.append(route)
    }
    
    
    enum Route: Equatable, Hashable {
        case onboarding
        case login
        case signup
        case tab
        case createCourse
        case joinCourse
        case classroom(any Course)

        @ViewBuilder
        var destination: some View {
            switch self {
            case .onboarding: OnboardingPage()
            case .login: LoginPage()
            case .signup: SignupPage()
            case .tab: HomeTabPage()
            case .createCourse: CreateCoursePage()
            case .joinCourse: JoinCoursePage()
            case .classroom(let course): ClassroomTab(course: course)
            }
        }
        
        static func == (lhs: NavigationStore.Route, rhs: NavigationStore.Route) -> Bool {
            switch (lhs, rhs) {
            case (.onboarding, .onboarding),
                (.login, .login),
                (.signup, .signup),
                (.tab, .tab),
                (.createCourse, .createCourse),
                (.joinCourse, .joinCourse):
                return true
                
            case let (.classroom(lhsCourse), .classroom(rhsCourse)):
                // Ensure `Course` also conforms to Equatable
                return lhsCourse.isEqual(to: rhsCourse)
                
            default:
                return false
            }
        }
        func hash(into hasher: inout Hasher) {
            switch self {
            case .onboarding:
                hasher.combine("onboarding")
            case .login:
                hasher.combine("login")
            case .signup:
                hasher.combine("signup")
            case .tab:
                hasher.combine("tab")
            case .createCourse:
                hasher.combine("createCourse")
            case .joinCourse:
                hasher.combine("joinCourse")
            case .classroom(let course):
                hasher.combine("classroom")
                hasher.combine(course.hashValue) 
            }
        }

    }
}


extension EnvironmentValues {
    @Entry var navigator = NavigationStore()
}
