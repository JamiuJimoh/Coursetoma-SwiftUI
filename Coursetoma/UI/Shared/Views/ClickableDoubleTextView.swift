//
//  ClickableDoubleTextView.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 10/02/2025.
//

import SwiftUI

struct ClickableDoubleTextView: View {
    let LText: String
    let RText: String
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(LText)
            Button(RText, action: action)
            .fontWeight(.bold)
        }
        .font(.callout)
    }
}
