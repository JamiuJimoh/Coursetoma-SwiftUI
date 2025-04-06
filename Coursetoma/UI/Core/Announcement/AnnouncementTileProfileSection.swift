//
//  AnnouncementProfileSection.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 28/03/2025.
//

import SwiftUI

struct AnnouncementTileProfileSection: View {
    @State private var showSheet = false
    @State private var showAlert = false

    var announcement: Announcement

    var body: some View {
        ProfileWithDateTile(
            profileImage: announcement.image as! AnyView,
            title: announcement.titleWithMaterial,
            date: announcement.createdAt) {
                Spacer()
                
                Menu {
                    Button("Edit") { showSheet = true }

                    Button("Delete", role: .destructive) { showAlert = true }
                } label: {
                    Image(systemName: "ellipsis")
                        .imageScale(.medium)
                }
                
            }
            .alert("Delete Announcement", isPresented: $showAlert) {
                Button ("Yes", role: .destructive) {
                    //TODO: - Handle delete announcement
                }
            } message: {
                Text("Are you sure you want to delete this announcement?")
            }
            .sheet(isPresented: $showSheet) {
                switch announcement.type {
                case .normal(_, _):
                    EditAnnouncementPage(announcement: announcement, isSheetOpen: $showSheet)
                case .material(let material):
                    EditMaterialPage(material: material, isSheetOpen: $showSheet)
                }
            }
    }
}

#Preview {
    AnnouncementTileProfileSection(announcement: Announcement.mockAnnouncements[0])
}
