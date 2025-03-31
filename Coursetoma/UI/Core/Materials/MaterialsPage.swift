//
//  MaterialsPage.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 25/03/2025.
//

import SwiftUI

struct MaterialsPage: View {
    @State private var showDetails = false
    @State private var showCreateMaterial = false

    var courseID: String

    var announcements: [Announcement] {
        Announcement.mockAnnouncements.filter { $0.type.isMaterial }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(announcements) { announcement in
                    ProfileWithDateTile(
                        profileImage: announcement.image as! AnyView,
                        title: announcement.title,
                        date: announcement.createdAt
                    ) {
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                //TODO: - Make this clickable to "more" context
                                print("More option")
                            }
                        
                        
                    }
                    .padding([.horizontal, .vertical], 10)
                    .contentShape(Rectangle())
                    .borderedContainerStyle()
                    .onTapGesture {
                        showDetails = true
                    }
                    .sheet(isPresented: $showDetails) {
                        AnnouncementDetailsPage(announcement: announcement, isSheetOpen: $showDetails)
                    }
                }
            }
            .padding()
        }
        .floatingActionButton {
            showCreateMaterial = true
        } label: {
            Image(systemName: "plus")
                .floatingActionButtonStyle()
        }
        .sheet(isPresented: $showCreateMaterial) { CreateMaterialPage() }
    }
}

#Preview {
    MaterialsPage(courseID: StudentCourse.mock[0].id)
}
