import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            // Background Structure
            BaseScreen()
            
            VStack {
                // Title Section inside the Blue Gradient
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sign in to your\nAccount")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)

                    Text("Login to your account.")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 18))
                }
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, UIScreen.main.bounds.height * 0.15) // Adjusting to fit inside blue area
                
                // White Section (Login Form)
                VStack(spacing: 20) {
                    // Email Field
                    AuthInputField(label: "Email", placeholder: "e.g. user@example.com", text: $email)
                        .padding(.bottom,20)
                    
                    // Password Field
                    AuthInputField(label: "Password", placeholder: "Enter your password", isSecure: true, text: $password)
                    
                    // Forgot Password
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .foregroundColor(Color(hex: "#0D92F4"))
                            .font(.footnote)
                    }
                    
                    // Login Button
                    Button(action: {
                        // Handle login action
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#0D92F4"))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 40) // Ensuring it's inside the white area
                
                // Divider with "or Login With"
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)

                    Text("or Login With")
                        .foregroundColor(.gray)
                        .padding(.bottom,20)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 25)
                .padding(.top, 20)

                // Social Login Buttons
                HStack(spacing: 15) {
                    SocialLoginButton(image: "Google", text: "Google") {
                        // Google Login Action
                    }
                    SocialLoginButton(image: "Apple", text: "Apple") {
                        // Apple Login Action
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 10)

                Spacer()

                // Sign-up Prompt
                HStack {
                    Text("Don't have an account?")
                    Text("Create one")
                        .foregroundColor(Color(hex: "#0D92F4"))
                }
                .font(.footnote)
                .padding(.bottom, 25)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    LoginView()
}
