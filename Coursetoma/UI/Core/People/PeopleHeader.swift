//
//  PeopleHeader.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 01/04/2025.
//

import SwiftUI

struct PeopleHeader: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.appPrimary)
                
                Spacer()
                
                Button(action: action) {
                    Image(systemName: "person.badge.plus")
                        .imageScale(.large)
                }
            }
            
            Divider()
                .dividerStyle()
        }
    }
}

#Preview {
    PeopleHeader(title: "Instructors") {
        
    }
}
