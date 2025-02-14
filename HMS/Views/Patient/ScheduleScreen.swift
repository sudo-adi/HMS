import SwiftUI

struct ScheduleScreen: View {
    @State private var selectedTab = "Schedule"
    @State private var selectedDate = Date()
    @State private var navigateToBooking = false  // Track navigation

    let tabs = ["Schedule", "History"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Top Bar
                VStack(spacing: 10) {
                    TabSwitcher(selectedTab: $selectedTab, tabs: tabs)
                    
                    if selectedTab == "Schedule" {
                        CalendarView(selectedDate: selectedDate, onDateSelected: { date in
                            selectedDate = date
                        })
                    }
                }
                .padding(.top, 50)

                // Appointments List / History
                ScrollView {
                    if selectedTab == "Schedule" {
                        VStack(alignment: .leading, spacing: 10) {
                            // ✅ Pass Navigation Action to AppointmentsSection
                            AppointmentsSection {
                                navigateToBooking = true
                            }

                            AppointmentCard(appointment: Appointment(
                                doctorName: "Dr. Ritu Sharma",
                                date: "26 FEB 2025",
                                time: "09:00",
                                status: "Attended",
                                isFollowUp: false
                            ))

                            AppointmentCard(appointment: Appointment(
                                doctorName: "Dr. Ritu Sharma",
                                date: "26 FEB 2025",
                                time: "09:00",
                                status: "Not-Attended",
                                isFollowUp: true
                            ))
                        }
                        .padding()
                    } else if selectedTab == "History" {
                        Text("No past appointments")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }

                // Bottom Navigation Bar (Uncomment if needed)
                // BottomNavBar(selectedTab: $selectedTab)
            }
            .background(Color(UIColor.systemGray6))
            .ignoresSafeArea(.all, edges: [.bottom])
            .navigationDestination(isPresented: $navigateToBooking) {
                AppointmentSelectionView()
                    .navigationTitle("Appointment Booking")
            }
        }
    }
}

// ✅ Preview
#Preview {
    ScheduleScreen()
}
