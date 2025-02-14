import SwiftUI

struct TabSwitcher: View {
    @Binding var selectedTab: String
    var tabs: [String] // Dynamically configurable tabs

    var body: some View {
        Picker(selection: $selectedTab, label: Text("Tabs")) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab).tag(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

// ✅ Dynamic Preview
#Preview {
    @Previewable @State var selectedTab = "Schedule"
    let dynamicTabs = ["Schedule", "History", "Upcoming"] // Example with 3 segments

    return TabSwitcher(selectedTab: $selectedTab, tabs: dynamicTabs)
}
