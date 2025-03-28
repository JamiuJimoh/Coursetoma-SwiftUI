//
//  PeoplePage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 25/03/2025.
//

import SwiftUI

struct PeoplePage: View {
    var course: any Course
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PeoplePage(course: StudentCourse.mock[0])
}
