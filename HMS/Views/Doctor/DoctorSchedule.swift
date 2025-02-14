//
//  ContentView.swift
//  DoctorTodayScreen
//
//  Created by Himani Bedi on 13/02/25.
//

import SwiftUI

struct DoctorSchedule: View {
    @State private var selectedSegment = "Today"
    @State private var selectedDate = Date() // Stores selected date
    @StateObject private var appointmentManager = AppointmentManager() // Use @StateObject

    var body: some View {
        VStack {
            Picker("Schedule Type", selection: $selectedSegment) {
                Text("Today").tag("Today")
                Text("Calendar").tag("Calendar")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedSegment == "Today" {
                HorizontalCalendarView(selectedDate: $selectedDate)
                    .onChange(of: selectedDate) { newValue in
                        appointmentManager.updateAppointments(for: newValue)
                    }
                
                ScrollView {
                    LazyVStack {
                        ForEach(8..<18, id: \.self) { hour in
                            ScheduleRow(hour: hour, appointments: appointmentManager.appointments)
                        }
                    }
                }
                .padding(.horizontal)
            } else {
                FullMonthCalendarView2()
            }

            Spacer()
            Divider()
            HStack {
                TabBarItem(icon: "calendar", title: "My Schedule")
                TabBarItem(icon: "person.2", title: "Patients")
                TabBarItem(icon: "bell", title: "Notifications")
            }
            .padding()
        }
        .onAppear {
            appointmentManager.updateAppointments(for: selectedDate)
        }
    }
}

// MARK: - Appointment Manager
class AppointmentManager: ObservableObject {
    @Published var appointments: [Appointment] = []
    
    func updateAppointments(for date: Date) {
        DispatchQueue.global(qos: .background).async {
            let newAppointments = generateAppointments(for: date)
            DispatchQueue.main.async {
                self.appointments = newAppointments
            }
        }
    }
}


// MARK: - Horizontal Calendar View
struct HorizontalCalendarView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(-3...3, id: \.self) { offset in
                    let day = Calendar.current.date(byAdding: .day, value: offset, to: Date())!
                    VStack {
                        Text(day.shortDay)
                            .font(.caption)
                        Text(day.dayNumber)
                            .font(.headline)
                            .padding(8)
                            .background(selectedDate.isSameDay(as: day) ? Color.blue : Color.clear)
                            .foregroundColor(selectedDate.isSameDay(as: day) ? Color.white : Color.primary)
                            .clipShape(Circle())
                    }
                    .onTapGesture {
                        selectedDate = day
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Schedule Row
struct ScheduleRow: View {
    let hour: Int
    let appointments: [Appointment]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(timeString(hour: hour))
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.vertical, 2)
            
            ForEach(appointments.filter { Calendar.current.component(.hour, from: $0.time) == hour }) { appointment in
                AppointmentCard(appointment: appointment)
            }
            Divider()
        }
    }
    
    func timeString(hour: Int) -> String {
        hour < 12 ? "\(hour) AM" : hour == 12 ? "12 PM" : "\(hour - 12) PM"
    }
}

// MARK: - Appointment Card
//struct AppointmentCard: View {
//    let appointment: Appointment
//    
//    var body: some View {
//        Text("\(appointment.patientName)'s Appointment")
//            .padding()
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.blue.opacity(0.2))
//            .cornerRadius(10)
//    }
//}

// MARK: - Tab Bar Item
struct TabBarItem: View {
    let icon: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(title)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Appointment Model
//struct Appointment: Identifiable {
//    let id = UUID()
//    let patientName: String
//    let time: Date
//}

// MARK: - Generate Appointments
func generateAppointments(for date: Date) -> [Appointment] {
    let calendar = Calendar.current
    let randomNames = ["Shreya", "Sahil", "Rajiv", "Neha", "Amit", "Rohit"]
    var appointments: [Appointment] = []

    let numberOfAppointments = Int.random(in: 3...5)
    for _ in 0..<numberOfAppointments {
        let randomHour = Int.random(in: 8...17)
        let randomMinute = [0, 15, 30, 45].randomElement()!
        let appointmentTime = calendar.date(bySettingHour: randomHour, minute: randomMinute, second: 0, of: date)!

//        let appointment = Appointment(patientName: randomNames.randomElement()!, time: appointmentTime)
        let appointment = Appointment(doctorName: randomNames.randomElement() ?? "Happy", date: Date(), time: .now, status: "available", isFollowUp: false)
        appointments.append(appointment)
    }

    return appointments
}

// MARK: - Date Extensions
extension Date {
    var shortDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
    
    var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }
    
    func isSameDay(as otherDate: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: otherDate)
    }
}

#Preview {
    DoctorSchedule()
}
