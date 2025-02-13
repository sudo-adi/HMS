import SwiftUI

struct HomeScreenView: View {
    @State private var selectedTab: String = "Home"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Top Bar Content
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hello User,")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)

                        Text("Good Morning")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    // Icons (Search, Bell, Profile)
                    HStack(spacing: 12) {
                        CircleIconButton(systemName: "magnifyingglass")

                        // 🔹 Bell Icon (No NavigationLink, Just an Icon)
                        CircleIconButton(systemName: "bell")

                        CircleIconButton(systemName: "person.crop.circle")
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)

                Spacer()

                // 🔹 Bottom Navigation Bar (Fixed at Bottom)
                BottomNavBar(selectedTab: $selectedTab)
            }
            .background(Color(UIColor.systemGray6))
            .ignoresSafeArea(.all, edges: [.bottom])
        }
    }
}

// ✅ **Preview**
#Preview {
    HomeScreenView()
}
