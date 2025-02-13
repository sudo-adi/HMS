//
//  SearchBar.swift
//  HMS
//
//  Created by Yankit Kumar on 13/02/25.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Find a Specialist", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar()
}
