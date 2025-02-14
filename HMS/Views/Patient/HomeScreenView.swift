import SwiftUI

struct HomeScreenView: View {
    @State private var selectedTab: String = "Home"
    @State private var showNotifications: Bool = false
    @State private var showSpecialists: Bool = false

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
                        CircleIconButton(systemName: "magnifyingglass") {
                            showSpecialists = true // ✅ Open modal
                        }

                        CircleIconButton(systemName: "bell") {
                            showNotifications = true // ✅ Open modal
                        }

                        CircleIconButton(systemName: "person.crop.circle", action: {})
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)

                Spacer()

                // 🔹 Bottom Navigation Bar
//                BottomNavBar(selectedTab: $selectedTab)
            }
            .background(Color(UIColor.systemGray6))
            .ignoresSafeArea(.all, edges: [.bottom])
            .sheet(isPresented: $showNotifications) {
                NotificationsView(showNotifications: $showNotifications)
            }
            .sheet(isPresented: $showSpecialists) {
                SpecialistsListView()
            }
            .onAppear {
                checkNavigationToHome()
            }
        }
    }

    private func checkNavigationToHome() {
        if UserDefaults.standard.bool(forKey: "navigateToHome") {
            UserDefaults.standard.set(false, forKey: "navigateToHome")  // Reset flag
            selectedTab = "Home"  // ✅ Ensure Home is selected
        }
    }
}

// ✅ Preview
#Preview {
    HomeScreenView()
}
