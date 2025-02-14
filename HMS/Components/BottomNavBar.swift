import SwiftUI

struct BottomNavBar: View {
    @Binding var selectedTab: String
    let tabs = [
        ("house.fill", "Home"),
        ("calendar", "Schedule"),
        ("square.grid.2x2.fill", "Utilities")
    ]

    var body: some View {
        HStack {
            ForEach(tabs, id: \.1) { icon, label in
                NavigationLink(destination: getDestination(for: label)) {
                    VStack {
                        Image(systemName: icon)
                            .font(.system(size: 22))
                            .foregroundColor(selectedTab == label ? .blue : .gray)
                        Text(label)
                            .font(.caption)
                            .foregroundColor(selectedTab == label ? .blue : .gray)
                    }
                    .frame(maxWidth: .infinity)
                }
                .simultaneousGesture(TapGesture().onEnded { selectedTab = label })
            }
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3)
    }
    
    // ✅ Function to return the correct screen
    @ViewBuilder
    private func getDestination(for tab: String) -> some View {
        switch tab {
        case "Home":
            ScheduleScreen()
            //HomeScreenView()
        case "Schedule":
            ScheduleScreen()
        case "Utilities":
            Text("Utilities Screen") // Replace with actual screen
        default:
            ScheduleScreen()
        }
    }
}

#Preview {
    NavigationStack {
        StatefulPreviewWrapper("Home") { BottomNavBar(selectedTab: $0) }
    }
}

// Helper for Stateful Preview
struct StatefulPreviewWrapper<Value: Equatable, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
