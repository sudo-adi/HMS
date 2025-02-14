//
//  OTPVerification.swift
//  HMS
//
//  Created by Yankit Kumar on 12/02/25.
//

import SwiftUI

struct OTPVerification: View {
    @State private var otp: [String] = Array(repeating: "", count: 4)
    
    var body: some View {
        ZStack(alignment: .top) {
            BaseScreen() // Background gradient and white section
            
            VStack(alignment: .leading, spacing: 16) {
                // Title & Subtitle (Aligned Left)
                VStack(alignment: .leading, spacing: 8) { // Increased spacing
                    Text("OTP Verification")
                        .font(.system(size: 32)) // Increased font size to 32
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Check your email to see the verification code.")
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.leading, 30)
                .padding(.top, 150) // Adjust position
                
                Spacer() // Push content down
                
                // White Card Section
                VStack(spacing: 30) {
                    // OTP Input Fields
                    PinInputView(pinLength: 4)
                    
                    // Verify OTP Button
                    PrimaryButton(title: "Verify OTP") {
                        print("OTP Entered: \(otp.joined())")
                    }
                    
                    // Bottom Login Link
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            print("Login tapped")
                        }) {
                            Text("Login")
                                .foregroundColor(.blue)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(16)
                .padding(.horizontal, 24)
                .padding(.bottom, 300)
                
                Spacer()
            }
        }
    }
}

// SwiftUI Preview
#Preview {
    OTPVerification()
}
