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
    @State private var showSheet = false
    @State private var showAlert = false

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

                        Menu {
                            Button("Edit") { showSheet = true }

                            Button("Delete", role: .destructive) { showAlert = true }
                        } label: {
                            Image(systemName: "ellipsis")
                                .imageScale(.medium)
                        }
                        .sheet(isPresented: $showSheet) {
                            switch announcement.type {
                            case .normal(_, _):
                                EmptyView()
                            case .material(let material):
                                EditMaterialPage(material: material, isSheetOpen: $showSheet)
                            }
            
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
                    .alert("Delete Material", isPresented: $showAlert) {
                        Button ("Yes", role: .destructive) {
                            //TODO: - Handle delete announcement
                        }
                    } message: {
                        Text("Are you sure you want to delete this material?")
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
        .sheet(isPresented: $showCreateMaterial) { EditMaterialPage(isSheetOpen: $showCreateMaterial) }
    }
}

#Preview {
    MaterialsPage(courseID: StudentCourse.mock[0].id)
}
