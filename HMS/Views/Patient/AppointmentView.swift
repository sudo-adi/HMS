import SwiftUI

struct AppointmentView: View {
    var appointmentID: String
    @Environment(\.presentationMode) var presentationMode // For dismissing the modal

    var body: some View {
        VStack {
            // Safe area padding to prevent overlap with notch
            VStack {
                HStack {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Text("Appointment #\(appointmentID)")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "chevron.left")
                        .opacity(0) // Invisible for symmetry
                }
                .padding(.horizontal)
            }
            .padding(.top, 50) // Adjust for dynamic island and notch

            Spacer()

            // Bottom action buttons
            HStack(spacing: 10) {
                PrimaryButton(title: "Cancel", action: {})
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )

                PrimaryButton(title: "Reschedule", action: {})
            }
            .padding(.horizontal)
            .padding(.bottom, 30) // Bottom spacing for safe area

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.white))
        .ignoresSafeArea(edges: .bottom) // Covers the entire screen but respects the top area
    }
}

#Preview {
    AppointmentView(appointmentID: "4567")
}
