//
//  SpecialistsListView.swift
//  HMS
//
//  Created by Yankit Kumar on 13/02/25.
//
import SwiftUI

struct SpecialistsListView: View {
    @State private var selectedFilter: String = "Physician"

    let doctors = [
        Doctor(name: "Dr. Ananya Kapoor", specialization: "Physician", experience: 10, age: 33),
        Doctor(name: "Dr. Ananya Kapoor", specialization: "Physician", experience: 10, age: 33),
        Doctor(name: "Dr. Ananya Kapoor", specialization: "Physician", experience: 10, age: 33),
        Doctor(name: "Dr. Ananya Kapoor", specialization: "Physician", experience: 10, age: 33)
    ]
    
    var filteredDoctors: [Doctor] {
        doctors.filter { $0.specialization == selectedFilter }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Specialists")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            SearchBar()
                .padding(.bottom, 10) // Add space below the search bar
            
            FilterChipsView(selectedFilter: $selectedFilter)
                .padding(.vertical, 10) // Add spacing above and below the filter chips

            ScrollView {
                VStack(spacing: 12) { // 🛠 Added spacing between doctor cards
                    ForEach(filteredDoctors) { doctor in
                        DoctorCard(doctor: doctor)
                    }
                }
                .padding(.top, 10) // Optional: Adds spacing above the doctor list
            }
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all)) // Background color F2F2F7
    }
}

#Preview {
    SpecialistsListView()
}
