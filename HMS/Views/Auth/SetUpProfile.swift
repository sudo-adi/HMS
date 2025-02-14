import SwiftUI

struct SetUpProfile: View {
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var dob: String = ""
    @State private var gender: String = ""
    @State private var contact: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            // Background Structure
            BaseScreen()
            
            VStack {
                // Title Section inside the Blue Gradient
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sign up to your\nAccount")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)

                    Text("Create your account.")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 18))
                }
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, UIScreen.main.bounds.height * 0.15) // Adjusting to fit inside blue area
                
                // White Section (Signup Form)
                VStack(spacing: 20) {
                    // Name Field
                    AuthInputField(label: "Name", placeholder: "e.g. Adam", text: $name)
                    
                    // Last Name Field
                    AuthInputField(label: "Last Name", placeholder: "e.g. Smith", text: $lastName)
                    
                    // DOB and Gender Fields in HStack
                    HStack(spacing: 15) {
                        AuthInputField(label: "DOB", placeholder: "08/03/2003", text: $dob)
                            .keyboardType(.numbersAndPunctuation)
                        
                        AuthInputField(label: "Gender", placeholder: "Select Gender", text: $gender)
                    }
                    
                    // Contact Field with Number Pad Keyboard Type
                    AuthInputField(label: "Contact", placeholder: "978XXXXX00", text: $contact)
                        .keyboardType(.numberPad)
                    
                    // Next Button
                    Button(action: {
                        // Handle next action
                    }) {
                        Text("Next")
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
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    SetUpProfile()
}
