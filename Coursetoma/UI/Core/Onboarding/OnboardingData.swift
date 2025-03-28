//
//  OnboardingData.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 19/01/2025.
//

import SwiftUI

struct OnboardingData: Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: Image
    
    static let all: [OnboardingData] = [
        OnboardingData(
            id: 0,
            title: "Create Courses",
            description: "Design engaging courses effortlessly and share them with your students.",
            image: Image(.onboarding1)
        ),
        OnboardingData(
            id: 1,
            title: "Manage Courses",
            description:"Organize your courses and oversee student participation with ease.",
            image: Image(.onboarding2)
        ),
        OnboardingData(
            id: 2,
            title: "Join Courses",
            description: "Enrol in courses and access interactive classrooms to connect with instructors and fellow students.",
            image: Image(.onboarding3)
        ),
    ]
}

