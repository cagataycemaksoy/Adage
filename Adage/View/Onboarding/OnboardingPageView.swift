//
//  OnboardingPageView.swift
//  Adage
//
//  Created by Cem Aksoy on 5.02.2026.
//

import SwiftUI

struct OnboardingPageView: View {
  let title: String
  let imgString: String
  let description: String
  let lastView: Bool
  
    var body: some View {
      ZStack {
        LinearGradient(colors: [.color1.opacity(0.4), .color1.opacity(0.5)],
                       startPoint: .topLeading,
                       endPoint: .bottom)
        .ignoresSafeArea()
        
        
      }
    }
}

#Preview {
    OnboardingPageView(title: "Welcome to \n Adage!", imgString: "img0", description: "Learn the language by studying real world phrases.", lastView: false)
}
