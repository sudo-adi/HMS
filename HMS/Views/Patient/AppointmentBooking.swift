import SwiftUI

struct AppointmentSelectionView: View {
    @State private var selectedSlot: String? = nil
    @State private var showBookedScreen = false  // ✅ State for modal presentation
    
    let timeSlots: [(time: String, type: TimeSlotType)] = [
        ("09:00", .booked), ("09:45", .free), ("10:30", .free),
        ("11:15", .booked), ("12:00", .free), ("14:00", .free),
        ("15:00", .free), ("16:00", .booked), ("17:00", .booked)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                // Calendar Component
                CalendarView()
                    .frame(height: 280)
                    .padding(.horizontal, 20)
                
                // Time Slots Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Available Slots")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 15) {
                            ForEach(timeSlots, id: \.time) { slot in
                                TimeSlotButton(time: slot.time, type: slot.type, isSelected: selectedSlot == slot.time) {
                                    selectedSlot = slot.time
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .frame(maxHeight: 230)
                    }
                }
                
                // Make an Appointment Button
                PrimaryButton(title: "Make an appointment") {
                    showBookedScreen = true
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
            .sheet(isPresented: $showBookedScreen) {
                AppointmentBookedView()
                    .interactiveDismissDisabled(true)  // ✅ Prevents accidental dismissal
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        AppointmentSelectionView()
    }
}
