import SwiftUI

struct BaseScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#0D92F4"), Color(hex: "#08558E")]),
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .frame(height: UIScreen.main.bounds.height * 0.3)
            .edgesIgnoringSafeArea(.top)
            
            Color.white
                .frame(height: UIScreen.main.bounds.height * 0.7)
        }
    }
}

// Helper to convert hex color to SwiftUI Color
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: Double
        switch hex.count {
        case 6: // RGB (Hex: #RRGGBB)
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        default:
            r = 0; g = 0; b = 0
        }
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    BaseScreen()
}
