//
//  DoctorCard.swift
//  HMS
//
//  Created by Yankit Kumar on 13/02/25.
//
import SwiftUI

struct DoctorCard: View {
    let doctor: Doctor
    
    var body: some View {
        HStack {
            Image("Ellipse 7") // Ensure this image exists in your assets
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(doctor.name)
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text(doctor.specialization)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Experience: \(doctor.experience) Years")
                    Spacer()
                    Text("Age: \(doctor.age) years")
                }
                .font(.caption)
                .foregroundColor(.black)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 2)
        .padding(.horizontal)
    }
}

// ✅ Model for Doctor
struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let specialization: String
    let experience: Int
    let age: Int
}

// ✅ SwiftUI Preview (Fixes the error)
struct DoctorCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCard(doctor: Doctor(name: "Dr. Ananya Kapoor", specialization: "Physician", experience: 10, age: 33))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
