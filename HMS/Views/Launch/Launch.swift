//
//  LandingPage.swift
//  GetStarted
//
//  Created by Himani Bedi on 12/02/25.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        ZStack {
                    Color(red: 13/255, green: 146/255, blue: 244/255)
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        Text("HMS")
                            .font(.system(size: 75, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("version 0.0.1 Beta")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                }
    }
}

#Preview {
    LandingPage()
}
