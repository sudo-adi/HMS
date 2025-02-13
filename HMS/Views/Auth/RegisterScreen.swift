import SwiftUI

struct RegisterScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            // Background Structure
            BaseScreen()
            
            VStack {
                // Title Section inside the Blue Gradient
                VStack(alignment: .leading, spacing: 5) {
                    Text("Create a new\nAccount")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Register your account.")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 18))
                }
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, UIScreen.main.bounds.height * 0.12)
                
                // White Section (Login Form)
                VStack(spacing: 20) {
                    // Email Field
                    AuthInputField(label: "Email", placeholder: "e.g. user@example.com", text: $email)

                    // Password Field with Eye Icon
                    PasswordInputField(label: "Password", placeholder: "Enter your password", text: $password, isVisible: $isPasswordVisible)

                    // Confirm Password Field with Eye Icon
                    PasswordInputField(label: "Confirm Password", placeholder: "Confirm Password", text: $confirmPassword, isVisible: $isConfirmPasswordVisible)

                    // Forgot Password
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .foregroundColor(Color(hex: "#0D92F4"))
                            .font(.footnote)
                    }

                    // Register Button
                    Button(action: {
                        // Handle register action
                    }) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#0D92F4"))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.top, 40)

                // Divider with "or Register With"
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)

                    Text("or register with")
                        .foregroundColor(.gray)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 20)
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
                .padding(.top, 15)

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

// MARK: - Password Input Field with Eye Icon
struct PasswordInputField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    @Binding var isVisible: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                if isVisible {
                    TextField(placeholder, text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    SecureField(placeholder, text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
            }
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 1))
        }
    }
}

#Preview {
    RegisterScreen()
}

