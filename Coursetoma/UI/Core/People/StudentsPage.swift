//
//  StudentsPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/04/2025.
//

import SwiftUI

struct StudentsPage: View {
    @State private var showInviteSheet = false
    
    var courseID: String
    
    var students: [User] { User.mockUsers }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PeopleHeader(title: "Students") {
                    showInviteSheet = true
                }
                .sheet(isPresented: $showInviteSheet) {
                    InvitePersonPage(inviteType: .student)
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
    StudentsPage(courseID: "ad")
}
