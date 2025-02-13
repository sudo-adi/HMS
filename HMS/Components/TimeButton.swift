import SwiftUI

enum TimeSlotType {
    case free, booked, selected
}

struct TimeSlotButton: View {
    let time: String
    let type: TimeSlotType
    let isSelected: Bool
    var action: () -> Void
    
    var backgroundColor: Color {
        switch type {
        case .free: return Color.white
        case .booked: return Color.gray.opacity(0.3)
        case .selected: return Color.blue.opacity(0.3)
        }
    }
    
    var textColor: Color {
        return type == .booked ? Color.gray : Color.black
    }
    
    var body: some View {
        Button(action: action) {
            Text(time)
                .font(.system(size: 16, weight: .medium))
                .frame(width: 90, height: 40)
                .background(isSelected ? Color.blue.opacity(0.5) : backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
        }
        .disabled(type == .booked) // Disable if booked
    }
}
#Preview {
    TimeSlotButton(time: "10:00 AM", type: .free, isSelected: false) { }    
}
