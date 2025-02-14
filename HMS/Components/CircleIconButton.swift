//
//  CircleIconButton.swift
//  HMS
//
//  Created by Dhruv Jain on 13/02/25.
//

import SwiftUI

struct CircleIconButton: View {
    let systemName: String

    var body: some View {
        Button(action: {}) {
            Image(systemName: systemName)
                .font(.system(size: 18))
                .foregroundColor(.gray)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 3)
        }
    }
}

#Preview {
    CircleIconButton(systemName: "bell")
}
