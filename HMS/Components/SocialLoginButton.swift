import SwiftUI

struct SocialLoginButton: View {
    var image: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(image)

                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(Color.gray.opacity(0.6))

                Text(text)
                    .foregroundColor(Color.gray.opacity(0.8))

            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.6), lineWidth: 1) // Border added here
            )
        }
    }
}

#Preview {
    SocialLoginButton(image: "Apple", text: "Apple", action: {})
}
