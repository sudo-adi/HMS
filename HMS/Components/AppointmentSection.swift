import SwiftUI

struct AppointmentsSection: View {
    var body: some View {
        HStack {
            Text("Appointments")
                .font(.title3)
                .bold()
            Spacer()
            Button(action: { /* Action for scheduling new */ }) {
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
    AppointmentsSection()
}
