import SwiftUI

struct AppointmentBookedView: View {
    @Environment(\.dismiss) private var dismiss  // ✅ To dismiss modal

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Verified Badge (Reusable Component)
            VerifiedBadgeView()
                .frame(width: 150, height: 150)

            // Success Message
            Text("Your Appointment has been Booked Successfully")
                .font(.system(size: 16, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.horizontal, 30)

            Spacer()

            // Buttons
            HStack(spacing: 16) {
                SecondaryButton(title: "Close") {
                    dismiss()  // ✅ Simply dismisses the modal
                }

                PrimaryButton(title: "View Details") {
                    print("View Details pressed")
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGray6))
        .ignoresSafeArea(edges: .bottom)
        .presentationDetents([.medium, .large])  // ✅ Modal height options
        .presentationDragIndicator(.visible)    // ✅ Shows drag handle
    }
}

#Preview {
    AppointmentBookedView()
}
