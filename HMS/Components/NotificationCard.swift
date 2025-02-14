import SwiftUI

struct NotificationCard: View {
    let doctorName: String
    let appointmentID: String
    let date: String
    let time: String
    let message: String
    let imageURL: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) { // 🔹 Increased spacing for better layout
            // 🔹 Top Section: Appointment ID & Date-Time
            HStack {
                Text("Appointment #\(appointmentID)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 14, height: 14) // 🔹 Slightly bigger icons
                        .foregroundColor(.gray)
                    Text(date)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 14, height: 14) // 🔹 Slightly bigger icons
                        .foregroundColor(.gray)
                    Text(time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            // 🔹 Middle Section: Image & Doctor Info (Shifted Down)
            HStack(spacing: 15) {
                Image(imageURL)
                    .resizable()
                    .frame(width: 60, height: 60) // 🔹 Bigger profile image
                    .clipShape(Circle())
                    .padding(.top, 6) // 🔹 Moves image slightly down
                
                VStack(alignment: .leading, spacing: 6) { // 🔹 More spacing for better readability
                    Text(doctorName)
                        .font(.system(size: 18, weight: .semibold)) // 🔹 Slightly bigger font
                        .foregroundColor(.blue)
                    
                    Text(message)
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.8))
                        .padding(.top, 2) // 🔹 Moves text down a bit
                }
            }
            .padding(.top, 8) // 🔹 Moves whole section further down
            
            // 🔹 Bottom Section: View Button
            HStack {
                Spacer()
                Text("View")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                    .padding(.top, 6) // 🔹 Moves button slightly down
            }
        }
        .padding(16) // 🔹 Increased padding for a larger card
        .background(Color.white)
        .cornerRadius(14) // 🔹 Slightly rounded corners
        .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 3) // 🔹 Softer shadow
        .padding(.horizontal)
    }
}

// 🔹 **Preview**
#Preview {
    NotificationCard(
        doctorName: "Dr. Ritu Sharma",
        appointmentID: "5673",
        date: "26 FEB 2025",
        time: "09:00",
        message: "You have an appointment with Dr. Ritu Sharma tomorrow",
        imageURL: "Ellipse 7"
    )
}
