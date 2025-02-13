import SwiftUI

struct CalendarView: View {
    @State private var currentMonth = Date()
    @State private var selectedDate: Date
    var onDateSelected: (Date) -> Void

    private let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]

    init(selectedDate: Date = Date(), onDateSelected: @escaping (Date) -> Void = { _ in }) {
        _selectedDate = State(initialValue: selectedDate)
        self.onDateSelected = onDateSelected
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: { shiftMonth(by: -1) }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(currentMonthFormatted)
                    .font(.headline)
                Spacer()
                Button(action: { shiftMonth(by: 1) }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)

            VStack {
                // Days of the week
                HStack {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                // Calendar grid
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                    ForEach(generateDates(), id: \.self) { date in
                        Text("\(Calendar.current.component(.day, from: date))")
                            .frame(width: 30, height: 30)
                            .background(selectedDate == date ? Color.blue : Color.clear)
                            .clipShape(Circle())
                            .onTapGesture {
                                selectedDate = date
                                onDateSelected(date)
                            }
                    }
                }
            }
            .padding(.top)
        }
        .padding()
    }

    private var currentMonthFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: currentMonth)
    }

    private func shiftMonth(by value: Int) {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }

    private func generateDates() -> [Date] {
        let calendar = Calendar.current
        let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentMonth))!
        let range = calendar.range(of: .day, in: .month, for: firstOfMonth)!
        return range.map { calendar.date(byAdding: .day, value: $0 - 1, to: firstOfMonth)! }
    }
}

#Preview {
    CalendarView()
}
