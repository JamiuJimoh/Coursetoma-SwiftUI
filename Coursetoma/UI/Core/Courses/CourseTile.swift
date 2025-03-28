//
//  CourseTile.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 18/02/2025.
//

import SwiftUI

struct CourseTile: View {
    var course: any Course
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(course.title)
                    .font(.headline)
                Spacer()
            }
            .padding(.bottom, 4)
            
            Text(course.code ?? "")
                .font(.subheadline)
                .padding(.bottom)

            Text(course.author)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding([.vertical, .leading], 12)
        .padding(.trailing, 8)
        .borderedContainerStyle()
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    CourseTile(course: StudentCourse.mock[0])
        .padding()
}
