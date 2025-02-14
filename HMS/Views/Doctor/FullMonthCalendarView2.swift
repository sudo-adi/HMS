//
//  FullMonthCalendarView2.swift
//  HMS
//
//  Created by Purushotam Kumar on 14/02/25.
//

import SwiftUI

struct FullMonthCalendarView2: View {
    @State private var selectedDate = Date()
    @State private var currentMonth = Date()
    
    var body: some View {
        VStack {
            // Month navigation
            HStack {
                Button(action: {
                    currentMonth = CalendarHelper().getPreviousMonth(date: currentMonth)
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Text(CalendarHelper().monthYearString(from: currentMonth))
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
                Button(action: {
                    currentMonth = CalendarHelper().getNextMonth(date: currentMonth)
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            // Scrollable list of months
            ScrollView(.vertical) {
                LazyVStack(spacing: 20) {
                    // We want to show 12 months from currentMonth dynamically
                    ForEach(0..<12, id: \.self) { monthOffset in
                        let month = CalendarHelper().getDateOfMonth(from: currentMonth, offset: monthOffset)
                        
                        VStack {
                            Text(CalendarHelper().monthYearString(from: month))
                                .font(.headline)
                                .padding(.top)
                            
                            // Calendar grid for each month
                            let daysInMonth = CalendarHelper().getMonthDays(date: month)
                            let firstDayOffset = CalendarHelper().firstDayOffset(date: month)
                            let totalCells = firstDayOffset + daysInMonth.count
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 7), spacing: 10) {
                                ForEach(0..<totalCells, id: \.self) { index in
                                    if index < firstDayOffset {
                                        Text("") // Empty spaces before month starts
                                            .frame(width: 40, height: 40)
                                    } else {
                                        let day = index - firstDayOffset + 1
                                        Text("\(day)")
                                            .frame(width: 40, height: 40)
                                            .background(CalendarHelper().isSameDay(date1: selectedDate, date2: CalendarHelper().getDate(day: day, from: month)) ? Color.blue.opacity(0.3) : Color.clear)
                                            .clipShape(Circle())
                                            .onTapGesture {
                                                selectedDate = CalendarHelper().getDate(day: day, from: month)
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

// MARK: - Calendar Helper Functions
struct CalendarHelper {
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    let weekDays = ["S", "M", "T", "W", "T", "F", "S"]
    
    func monthYearString(from date: Date) -> String {
        dateFormatter.dateFormat = "MMMM YYYY"
        return dateFormatter.string(from: date)
    }
    
    func getMonthDays(date: Date) -> [Int] {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return [] }
        return Array(range)
    }
    
    func firstDayOffset(date: Date) -> Int {
        let components = calendar.dateComponents([.year, .month], from: date)
        guard let firstDay = calendar.date(from: components) else { return 0 }
        return calendar.component(.weekday, from: firstDay) - 1 // Adjust to match Sunday-start calendar
    }
    
    func getNextMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date) ?? date
    }
    
    func getPreviousMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date) ?? date
    }
    
    func getDate(day: Int, from date: Date) -> Date {
        var components = calendar.dateComponents([.year, .month], from: date)
        components.day = day
        return calendar.date(from: components) ?? date
    }
    
    func getDateOfMonth(from date: Date, offset: Int) -> Date {
        var components = calendar.dateComponents([.year, .month], from: date)
        components.month! += offset // Offset from currentMonth
        return calendar.date(from: components) ?? date
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

// MARK: - Tab Bar Item
//struct TabBarItem: View {
//    let icon: String
//    let title: String
//
//    var body: some View {
//        VStack {
//            Image(systemName: icon)
//            Text(title)
//                .font(.footnote)
//        }
//        .frame(maxWidth: .infinity)
//    }
//}

#Preview {
    FullMonthCalendarView2()
}

