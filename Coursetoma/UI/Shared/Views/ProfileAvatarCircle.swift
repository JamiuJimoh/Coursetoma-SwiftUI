//
//  ProfileAvatarCircle.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 15/02/2025.
//

import SwiftUI

struct ProfileAvatarCircle: View {
    var size = 50.0
    let avatarURL: URL?
    let initials: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.appGreyBorder)
            
            Group {
                AsyncImage(url: avatarURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    default:
                        Text(initials)
                            .avatarTextStyle(size)
                    }
                }
            }
        }
//        .overlay  {
//            Circle().stroke()
//        }
        .frame(width: size, height: size)
        .borderedContainerStyle(cornerRadius: size)
    }
}

#Preview {
    let user = User.mockCurrentUser
    ProfileAvatarCircle(avatarURL: user.avatarURL, initials: user.initials)
}
