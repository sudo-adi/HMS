import SwiftUI

struct AppointmentBookedView: View {
    @Environment(\.presentationMode) var presentationMode  // To handle back navigation

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                // Back Button & Title (Properly Positioned Below the Notch)
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Dismiss the view
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                    .padding(.leading, 20)

                    Spacer()

                    Text("Appointment Booked")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)

                    Spacer()

                    // Empty space to keep the title centered
                    Spacer()
                        .frame(width: 40)
                }
                .padding(.top, geometry.safeAreaInsets.top + 10) // Adjusted for Safe Area
                .padding(.horizontal, 10)

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

                // Buttons with Leading & Trailing Padding
                HStack(spacing: 16) {
                    SecondaryButton(title: "Close") {
                        print("Close pressed")
                    }

                    PrimaryButton(title: "View Details") {
                        print("View Details pressed")
                    }
                }
                .padding(.horizontal, 20) // Added padding on both sides
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
            .ignoresSafeArea(edges: .bottom) // Only ignore bottom safe area, not top
        }
    }
}

#Preview {
    AppointmentBookedView()
}
