import SwiftUI

struct AppointmentSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedSlot: String? = nil
    
    let timeSlots: [(time: String, type: TimeSlotType)] = [
        ("09:00", .booked), ("09:45", .free), ("10:30", .free),
        ("11:15", .booked), ("12:00", .free), ("14:00", .free),
        ("15:00", .free), ("16:00", .booked), ("17:00", .booked)
    ]
    
    var body: some View {
        VStack(spacing: 15) {
            // Title & Back Button
            HStack {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.title2)
                }
                Spacer()
                Text("Choose date and time")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Calendar Component
            CalendarView()
                .frame(height: 280) // Adjusted height
                .padding(.horizontal, 20) // Less padding
            
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
                    .padding(.horizontal, 20) // Less padding
                    .frame(maxHeight: 230) // Adjusted height
                }
            }
            
            // Make an Appointment Button
            PrimaryButton(title: "Make an appointment") {
                // Handle appointment confirmation
            }
            .padding(.horizontal, 20) // Reduced side space
            .padding(.bottom, 60) // Less bottom space
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Take full screen width
        .background(Color(UIColor.systemGray6))
        .ignoresSafeArea(edges: .bottom) // Avoid extra bottom padding
    }
}

// MARK: - Preview
#Preview {
    AppointmentSelectionView()
        .previewDevice("iPhone 16 Pro")
}
