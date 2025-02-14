//
//  AppointmentsDoctor.swift
//  DoctorTodayScreen
//
//  Created by mac on 13/02/25.
//

import SwiftUI

struct AppointmentsDoctor: View {
    @State private var chosenDate = Date()
    @State private var events: [Event] = createEvents(for: Date())
    
    var body: some View {
        VStack {
            // Date Selector
            DateSelectorView(selectedDate: $chosenDate)
                .onChange(of: chosenDate) { newValue in
                    events = createEvents(for: newValue)
                }
            
            // Event Schedule
            ScrollView {
                LazyVStack {
                    ForEach(8..<18, id: \.self) { hour in // Fixed the ID issue
                        TimeSlotView(hour: hour, events: events)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            Divider()
            BottomNavigationBar()
        }
    }
}

// MARK: - Date Selector
struct DateSelectorView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            Text("Appointments For, \(formattedDate(selectedDate))")
                .font(.subheadline) // Smaller font size
                .foregroundColor(.gray) // Lighter color
                .padding(.top, 8)
            
            HorizontalDateScroller(selectedDate: $selectedDate)
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EEEE"
        return formatter.string(from: date)
    }
}

// MARK: - Horizontal Date Scroller
struct HorizontalDateScroller: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(-3...3, id: \.self) { offset in // Fixed the ID issue
                    let day = Calendar.current.date(byAdding: .day, value: offset, to: Date())!
                    VStack {
                        Text(day.dayOfWeek)
                            .font(.caption)
                        Text(day.dayOfMonth)
                            .font(.headline)
                            .foregroundColor(selectedDate.isSameDay(as: day) ? .white : .primary) // White for selected, default for others
                            .padding(8)
                            .background(selectedDate.isSameDay(as: day) ? Color.blue : Color.clear)
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

// MARK: - Time Slot View
struct TimeSlotView: View {
    let hour: Int
    let events: [Event]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(hourFormatted(hour))
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.vertical, 2)
            
            ForEach(events.filter { Calendar.current.component(.hour, from: $0.time) == hour }) { event in
                EventCard(event: event)
            }
            
            Divider()
        }
    }
    
    func hourFormatted(_ hour: Int) -> String {
        if hour < 12 {
            return "\(hour) AM"
        } else if hour == 12 {
            return "12 PM"
        } else {
            return "\(hour - 12) PM"
        }
    }
}

// MARK: - Event Card
struct EventCard: View {
    let event: Event
    
    var body: some View {
        Text("\(event.title)")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
    }
}

// MARK: - Bottom Navigation
struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            NavigationItem(icon: "calendar", label: "Schedule")
            NavigationItem(icon: "person.2", label: "Clients")
            NavigationItem(icon: "bell", label: "Alerts")
        }
        .padding()
    }
}

struct NavigationItem: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(label)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Event Model
struct Event: Identifiable {
    let id = UUID()
    let title: String
    let time: Date
}

// MARK: - Generate Events
func createEvents(for date: Date) -> [Event] {
    let calendar = Calendar.current
    let sampleTitles = ["Shreya’s Appointment", "Sahil’s Appointment", "Rajiv’s Follow-up"]
    var events: [Event] = []
    
    let numberOfEvents = Int.random(in: 3...5)
    for _ in 0..<numberOfEvents {
        let randomHour = Int.random(in: 8...17)
        let randomMinute = [0, 15, 30, 45].randomElement()!
        let eventTime = calendar.date(bySettingHour: randomHour, minute: randomMinute, second: 0, of: date)!
        let event = Event(title: sampleTitles.randomElement()!, time: eventTime)
        events.append(event)
    }
    
    return events
}

// MARK: - Date Extensions
extension Date {
    var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
    
    var dayOfMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }
    
    func isSameDay(as other: Date) -> Bool { // Fixed function name to camelCase
        Calendar.current.isDate(self, inSameDayAs: other)
    }
}

#Preview {
    AppointmentsDoctor()
}
