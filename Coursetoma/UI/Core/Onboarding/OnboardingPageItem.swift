//
//  OnboardingPageItem.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 19/01/2025.
//

import SwiftUI

struct OnboardingPageItem: View {
    @Environment(\.navigator) private var navigator
    
    let data: OnboardingData
    
    var body: some View {
        VStack {
            data.image
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .center) {
                Group {
                    Text(data.title)
                        .font(.title.weight(.bold))
                        .padding(.bottom, 8)
                    Text(data.description)
                        .font(.callout)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                
               
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    OnboardingPageItem(data: OnboardingData.all.first!)
}
