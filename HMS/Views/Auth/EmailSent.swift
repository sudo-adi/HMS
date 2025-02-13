//
//  EmailSent.swift
//  HMS
//
//  Created by mac on 12/02/25.
//

import SwiftUI

struct EmailSent: View {
    var body: some View {
        VStack(spacing: 0) {
            // Gradient Header (Covers Notch & Full Width)
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#0D92F4"), Color(hex: "#08558E")]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .frame(height: UIScreen.main.bounds.height * 0.28) // Adjusted height
            .overlay(
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email Sent")
                        .font(.system(size: 34, weight: .bold)) // Bigger size
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 24)

                    Text("Kindly check your email list.")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 24)
                }
                .padding(.top, 60)
                .padding(.top, 60)
            )
            .edgesIgnoringSafeArea(.top) // Ensures gradient covers notch

            Spacer(minLength: 10) // Reduced space above badge

            // Verified Badge - Slightly Smaller & Moved Up
            VerifiedBadgeView()
                .frame(width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.width * 0.75)
                .offset(y: -20) // Moves badge up

            Spacer(minLength: 10) // Adjusted space below badge

            // Reset Password Message - Ensured 2-line visibility & Darker Link
            VStack(spacing: 6) {
                Image(systemName: "link")
                    .foregroundColor(.blue)

                Text("Reset password \n link sent to your email")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color.blue.opacity(0.85)) // Slightly darker
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8) // Ensures proper wrapping
            }

            Spacer(minLength: 20)

            // Button - Fixed Placement
            PrimaryButton(title: "Go back to Login", icon: "arrow.right") {
                print("Navigate to Login")
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: 60)

            Spacer(minLength: 40) // Ensures no extra bottom space
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    EmailSent()
}
