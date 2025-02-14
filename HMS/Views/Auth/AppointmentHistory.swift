//
//  AppointmentCard.swift
//  HMS
//
//  Created by Yankit Kumar on 13/02/25.
//
import SwiftUI

// MARK: - Model for Appointment
struct Appointment: Identifiable {
    let id = UUID()
    let doctorName: String
    let date: Date
    let time: Date
    let status: String
    let isFollowUp: Bool
}

// MARK: - ViewModel for Fetching Data
class AppointmentViewModel: ObservableObject {
    @Published var selectedTab: String = "History"
    
    let appointments: [Appointment] = [
        Appointment(doctorName: "Dr. Ritu Sharma", date: .now, time: .now, status: "Attended", isFollowUp: false),
        Appointment(doctorName: "Dr. Ritu Sharma", date: .now, time: .now, status: "Attended", isFollowUp: false),
        Appointment(doctorName: "Dr. Ritu Sharma", date: .now, time: .now, status: "Attended", isFollowUp: false),
        Appointment(doctorName: "Dr. Ritu Sharma", date: .now, time: .now, status: "Attended", isFollowUp: false),
        
    ]
}

// MARK: - Reusable AppointmentCard Component
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
                    Text(appointment.date.description)
                    Image(systemName: "clock")
                    Text(appointment.time.description)
                }
                .font(.caption)
                .foregroundColor(.black)
            }
            Spacer()
            
            // Smaller Status Text
            Text(appointment.status.description)
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

// MARK: - Main View
struct AppointmentListView: View {
    @StateObject private var viewModel = AppointmentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Clickable Schedule & History Tabs
                Picker("", selection: $viewModel.selectedTab) {
                    Text("Schedule").tag("Schedule")
                    Text("History").tag("History")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(viewModel.appointments) { appointment in
                    AppointmentCard(appointment: appointment)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .background(Color(UIColor.systemGray6)) // Background color F2F2F7
            }
            .navigationTitle("Appointments")
            .background(Color(UIColor.systemGray6)) // Background color F2F2F7
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentListView()
    }
}
