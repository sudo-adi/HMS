import SwiftUI

struct ForgotPassword: View {
    @State private var email: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            // Background
            BaseScreen()
            
            VStack(spacing: 40) { // Adjusted spacing for better alignment
                // Title Section inside the Blue Gradient
                VStack(alignment: .leading, spacing: 8) {
                    Text("Forgot Password")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)

                    Text("Enter your email to reset your password.")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 25))
                }
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, UIScreen.main.bounds.height * 0.15) // Properly positioned
                
                // White Section (Email Field & Button)
                VStack(spacing: 25) {
                    // Email Input Field
                    AuthInputField(label: "Email", placeholder: "e.g. user@example.com", text: $email)
                        .padding(.bottom, 3)
                    
                    // Get OTP Button
                    Button(action: {
                        print("Get OTP pressed")
                    }) {
                        Text("Get OTP")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#0D92F4"))
                            .cornerRadius(10)
                    }
                    
                    // Sign-in Prompt (Properly positioned below Get OTP)
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            print("Login tapped")
                        }) {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "#0D92F4"))
                        }
                    }
                    .font(.footnote)
                    .padding(.top, 15) // Added space below "Get OTP"
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 30) // Ensures better spacing in the white section
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ForgotPassword()
}
