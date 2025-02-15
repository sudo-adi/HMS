import SwiftUI

struct NotificationsView: View {
    @Binding var showNotifications: Bool // ✅ Binding to dismiss the modal

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 18) {
                // 🔹 Title & Close Button
                HStack {
                    Button {
                        showNotifications = false // ✅ Dismiss modal
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .padding(.leading)

                    Spacer()

                    Text("Notifications")
                        .font(.system(size: 22, weight: .bold))

                    Spacer()

                    // Spacer to balance alignment
                    Color.clear.frame(width: 40, height: 40)
                }
                .padding(.top, 10)

                // 🔹 Reusable Notification Card
                NotificationCard(
                    doctorName: "Dr. Ritu Sharma",
                    appointmentID: "5673",
                    date: "26 FEB 2025",
                    time: "09:00",
                    message: "You have an appointment with Dr. Ritu Sharma tomorrow",
                    imageURL: "Ellipse 7"
                )
                .padding(.horizontal)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
        }
    }
}

#Preview {
    NotificationsView(showNotifications: .constant(true))
}
