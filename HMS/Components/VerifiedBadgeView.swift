//
//  VerifiedBadgeView.swift
//  HMS
//
//  Created by mac on 12/02/25.
//

import SwiftUI

struct VerifiedBadgeView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.width * 0.9  // 90% of container width
            
            ZStack {
                // Outer Thin Circle Border
                Circle()
                    .stroke(Color.blue.opacity(0.6), lineWidth: 1) // Thin outer border
                    .frame(width: size, height: size)

                // Main Blue Circle
                Circle()
                    .fill(Color.blue)
                    .frame(width: size * 0.95, height: size * 0.95)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2) // Inner white border
                    )

                // Checkmark Icon
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size * 0.5, height: size * 0.5)
                    .foregroundColor(.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
        }
    }
}

struct VerifiedBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifiedBadgeView()
            .frame(width: 300, height: 300) // Preview size
    }
}

#Preview {
    VerifiedBadgeView()
}
