//
//  ClickableDoubleTextView.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 10/02/2025.
//

import SwiftUI

struct ClickableDoubleTextView: View {
    var LText: String
    var RText: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(LText)
            Button(RText, action: action)
            .fontWeight(.bold)
        }
        .font(.callout)
    }
}
