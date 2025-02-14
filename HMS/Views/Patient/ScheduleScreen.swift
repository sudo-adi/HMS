import SwiftUI

struct ScheduleScreen: View {
    @State private var selectedTab = "Schedule"
    @State private var selectedDate = Date()
    
    // Dynamic Tabs
    let tabs = ["Schedule", "History"]

   

    var body: some View {
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
                        
                        AppointmentsSection ()
                        
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

            // Bottom Navigation
            BottomNavBar(selectedTab: $selectedTab)
        }
        .background(Color(UIColor.systemGray6))
        .ignoresSafeArea(.all, edges: [.bottom])
    }
}

// ✅ **Preview**
#Preview {
    ScheduleScreen()
}
