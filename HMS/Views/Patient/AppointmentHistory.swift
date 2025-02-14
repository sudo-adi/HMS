import SwiftUI

struct AppointmentHistoryView: View {
    @State private var selectedTab = "History"
    let tabs = ["Schedule", "History"]
    let appointments: [Appointment] = [
        Appointment(doctorName: "Dr. Ritu Sharma", date: "26 FEB 2025", time: "09:00", status: "Attended", isFollowUp: false),
        Appointment(doctorName: "Dr. Ritesh Garg", date: "26 FEB 2025", time: "09:00", status: "Cancelled", isFollowUp: true),
        Appointment(doctorName: "Dr. Ritesh Garg", date: "26 FEB 2025", time: "09:00", status: "Not-attended", isFollowUp: true)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Appointment")
                    .font(.largeTitle.bold())
                    .padding(.leading)
                    .padding(.top, 10)
                
                TabSwitcher(selectedTab: $selectedTab, tabs: tabs)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(appointments) { appointment in
                            AppointmentCard(appointment: appointment)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 20) // Space for bottom bar
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGroupedBackground))
            .edgesIgnoringSafeArea(.bottom) // Ensures bottom bar fits properly
        }
    }
}

#Preview {
    AppointmentHistoryView()
}
