//
//  PatientTabBarView.swift
//  HMS
//
//  Created by Dhruv Jain on 14/02/25.
//
import SwiftUI

struct PatientTabBarView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white // ✅ Set tab bar background to white
    }

    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            ScheduleScreen()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")
                }
                .navigationTitle("Shecdule")

            LastScreenView()
                .tabItem {
                    Label("Last", systemImage: "clock.fill")
                }
        }
        .accentColor(.blue)
        .background(Color.white.ignoresSafeArea()) // ✅ Ensures full white background
    }
}



// ✅ Dummy Screens (Replace with actual views)
struct LastScreenView: View {
    var body: some View {
        Text("Last Screen")
            .font(.title)
            .padding()
    }
}

#Preview {
    PatientTabBarView()
}
