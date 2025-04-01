//
//  InstructorsPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/04/2025.
//

import SwiftUI

struct InstructorsPage: View {
    var courseID: String
    
    var students: [User] { Array(User.mockUsers[0..<3]) }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PeopleHeader(title: "Instructors") {
                    //TODO: - Add user
                }
                
                ForEach(students) { student in
                    PersonTile(person: student) {
                        Spacer()
                        
                        //TODO: - check permission
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                //TODO: - Make this clickable to "more" context
                                print("More option")
                            }
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    InstructorsPage(courseID: "adf")
}
