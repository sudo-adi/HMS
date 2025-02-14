import SwiftUI

struct CircleIconButton: View {
    let systemName: String
    let action: () -> Void // ✅ Action closure for reusability

    var body: some View {
        Button(action: action) { // ✅ Calls the provided action
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

// ✅ Preview
#Preview {
    CircleIconButton(systemName: "bell", action: {})
}
