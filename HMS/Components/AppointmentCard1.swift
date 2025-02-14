////
////  AppointmentCard.swift
////  HMS
////
////  Created by Yankit Kumar on 13/02/25.
////
//
//import SwiftUI
//
////// MARK: - Model for Appointment
////struct Appointment: Identifiable {
////    let id = UUID()
////    let doctorName: String
////    let date: String
////    let time: String
////    let status: String
////    let isFollowUp: Bool
////}
////
////// MARK: - Reusable AppointmentCard Component
////struct AppointmentCard: View {
////    let appointment: Appointment
////    
////    var statusColor: Color {
////        switch appointment.status {
////        case "Attended": return .blue
////        case "Cancelled": return .gray
////        case "Not-attended": return .gray
////        default: return .black
////        }
////    }
//    
//    var body: some View {
//        HStack {
//            // Profile Image
//            Image("Ellipse 7")
//                .resizable()
//                .frame(width: 50, height: 50)
//                .clipShape(Circle()) // Makes it circular
//            
//            VStack(alignment: .leading, spacing: 4) {
//                // Appointment Number
//                Text("Appointment #5673")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//                
//                HStack {
//                    Text(appointment.doctorName)
//                        .font(.subheadline)
//                        .foregroundColor(.blue)
//                    
//                    if appointment.isFollowUp {
//                        Text("Follow-up")
//                            .font(.caption2)
//                            .padding(.horizontal, 6)
//                            .padding(.vertical, 2)
//                            .background(Color.blue.opacity(0.2))
//                            .cornerRadius(5)
//                    }
//                }
//                
//                HStack {
//                    Text(appointment.date)
//                    Image(systemName: "clock")
//                    Text(appointment.time)
//                }
//                .font(.caption)
//                .foregroundColor(.black)
//            }
//            Spacer()
//            
//            // Reschedule Button
//            Button(action: { /* Reschedule Logic */ }) {
//                Text("Reschedule")
//                    .font(.caption)
//                    .foregroundColor(.blue)
//                    .bold()
//            }
//        }
//        .padding()
//        .background(Color.white) // Card background color
//        .cornerRadius(10)
//        .shadow(radius: 2)
//    }
//}
//
//// MARK: - Preview
//struct AppointmentCard_Previews: PreviewProvider {
//    static var previews: some View {
//        AppointmentCard(appointment: Appointment(
//            doctorName: "Dr. Ritu Sharma",
//            date: "26 FEB 2025",
//            time: "09:00",
//            status: "Attended",
//            isFollowUp: false
//        ))
//        .previewLayout(.sizeThatFits)
//        .padding()
//    }
//}
