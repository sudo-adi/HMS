//
//  SecondaryButton.swift
//  HMS
//
//  Created by Dhruv Jain on 13/02/25.
//

import SwiftUI
struct SecondaryButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.blue)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 1)
                )
        }
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    SecondaryButton(title: "Close") {
        print("Close button pressed")
    }
}
