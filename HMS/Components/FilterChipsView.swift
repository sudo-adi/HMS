//
//  FilterChipsView.swift
//  HMS
//
//  Created by Yankit Kumar on 13/02/25.
//

import SwiftUI

struct FilterChipsView: View {
    @Binding var selectedFilter: String
    let filters = ["Physician", "Therapist", "Dermatologist", "Pediatrician"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filters, id: \.self) { filter in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedFilter = filter
                        }
                    }) {
                        Text(filter)
                            .font(.system(size: 14, weight: .medium))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(selectedFilter == filter ? Color.blue : Color(.systemGray5))
                            .foregroundColor(selectedFilter == filter ? .white : .black)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedFilter == filter ? Color.blue : Color.clear, lineWidth: 1)
                            )
                            .shadow(color: selectedFilter == filter ? Color.blue.opacity(0.3) : Color.clear, radius: 3)
                    }
                    .buttonStyle(PlainButtonStyle()) // Prevent default button styling
                }
            }
            .padding(.horizontal)
        }
    }
}
#Preview {
    FilterChipsView(selectedFilter: .constant(""))
}