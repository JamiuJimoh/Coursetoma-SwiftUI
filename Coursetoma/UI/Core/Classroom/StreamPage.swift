//
//  StreamPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 25/03/2025.
//

import SwiftUI
//add announcement thread
struct StreamPage: View {
    var course: any Course
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                //MARK: - BANNER SECTION
                CourseBannerSection()
                
                //MARK: - ANNOUNCEMENTS SECTION
                AnnouncementMakerButton()
                
                ForEach(Announcement.mockAnnouncements) { announcement in
                    AnnouncementTile(announcement: announcement)
                }
            }
            .padding()
        }
    }
}

#Preview {
    StreamPage(course: StudentCourse.mock[0])
}
