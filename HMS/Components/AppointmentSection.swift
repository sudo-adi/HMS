import SwiftUI

struct AppointmentsSection: View {
    var onScheduleNew: () -> Void  // Closure to handle navigation

    var body: some View {
        HStack {
            Text("Appointments")
                .font(.title3)
                .bold()
            Spacer()
            Button(action: onScheduleNew) {  // Use the passed action
                Text("+ Schedule New")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    AppointmentsSection(onScheduleNew: {})
}
