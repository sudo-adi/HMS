import SwiftUI

struct PrimaryButton: View {
    var title: String
    var icon: String? = nil // Optional SF Symbol icon
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.headline)
                
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        PrimaryButton(title: "Login", action: {})
        PrimaryButton(title: "Continue", icon: "arrow.right", action: {})
    }
    .padding()
}
