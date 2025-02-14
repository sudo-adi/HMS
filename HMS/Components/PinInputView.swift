//
//  PinInputView.swift
//  HMS
//
//  Created by Yankit Kumar on 12/02/25.
//
import SwiftUI

struct PinInputView: View {
    let pinLength: Int
    @State private var pin: [String]
    @FocusState private var focusedIndex: Int? // Tracks which field is active
    
    init(pinLength: Int) {
        self.pinLength = pinLength
        self._pin = State(initialValue: Array(repeating: "", count: pinLength))
    }
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<pinLength, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        .frame(width: 50, height: 50)

                    Text(pin[index]) // Show the input character directly
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    TextField("", text: Binding(
                        get: { self.pin[index] },
                        set: { newValue in
                            if newValue.count <= 1 { // Restrict input to 1 character
                                self.pin[index] = newValue
                                
                                // Move to the next field if it's not empty
                                if !newValue.isEmpty && index < pinLength - 1 {
                                    focusedIndex = index + 1
                                }
                            } else {
                                // Trim excess characters
                                self.pin[index] = String(newValue.prefix(1))
                            }
                        }
                    ))
                    .frame(width: 50, height: 50)
                    .foregroundColor(.clear) // Hide actual input
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedIndex, equals: index) // Manage focus
                    
                    // Detect backspace to move focus back
                    .onChange(of: pin[index]) { newValue in
                        if newValue.isEmpty && index > 0 {
                            focusedIndex = index - 1
                        }
                    }
                }
            }
        }
        .onAppear {
            focusedIndex = 0 // Auto-focus first field on launch
        }
    }
}

// **SwiftUI Preview**
#Preview {
    PinInputView(pinLength: 4)
}

