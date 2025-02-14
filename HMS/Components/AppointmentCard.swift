//
//  AppointmentCard.swift
//  HMS
//
//  Created by Dhruv Jain on 14/02/25.
//

import SwiftUI
struct Appointment: Identifiable {
    let id = UUID()
    let doctorName: String
    let date: String
    let time: String
    let status: String
    let isFollowUp: Bool
}



struct AppointmentCard: View {
    let appointment: Appointment
    
    var statusColor: Color {
        switch appointment.status {
        case "Attended": return .blue
        case "Cancelled": return .gray
        case "Not-attended": return .gray
        default: return .black
        }
    }
    
    var body: some View {
        HStack {
            // Use Image from Assets (Ellipse 7)
            Image("Ellipse 7")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle()) // Makes it circular
            
            VStack(alignment: .leading, spacing: 4) {
                // Appointment Number on Top
                Text("Appointment #5673")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Text(appointment.doctorName)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    if appointment.isFollowUp {
                        Text("Follow-up")
                            .font(.caption2)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(5)
                    }
                }
                
                HStack {
                    Text(appointment.date)
                    Image(systemName: "clock")
                    Text(appointment.time)
                }
                .font(.caption)
                .foregroundColor(.black)
            }
            Spacer()
            
            // Smaller Status Text
            Text(appointment.status)
                .foregroundColor(statusColor)
                .font(.caption)
                .bold()
                .frame(width: 80, alignment: .trailing)
        }
        .padding()
        .background(Color.white) // Card background color
        .cornerRadius(10)
    }
}
#Preview {
    AppointmentCard(appointment: Appointment(
        doctorName: "Dr. Ritu Sharma",
        date: "26 FEB 2025",
        time: "09:00",
        status: "Attended",
        isFollowUp: false
    ))
}

