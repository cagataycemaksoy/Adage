//
//  OnboardingView.swift
//  Adage
//
//  Created by Cem Aksoy on 5.02.2026.
//

import SwiftUI

struct OnboardingView: View {
  @State private var selectedView = 0
  
  var body: some View {
    ZStack {
      LinearGradient(colors: [.color1.opacity(0.4), .color1.opacity(0.5)],
                     startPoint: .topLeading,
                     endPoint: .bottom)
      .ignoresSafeArea()
      
      TabView(selection: $selectedView) {
        OnboardingPageView(title: "Welcome to \n Adage!", imgString: "img0", description: "Learn the language by studying real world phrases.", lastView: false, buttonAction: buttonAction)
          .tag(0)
        
        OnboardingPageView(title: "Practice by Recalling", imgString: "img1", description: "Swipe your favorite phrases.", lastView: false, buttonAction: buttonAction)
          .tag(1)
        
        OnboardingPageView(title: "Let's Get Started!", imgString: "img2", description: "Ready to learn new phrases?", lastView: true, buttonAction: buttonAction)
          .tag(2)
        
      }
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(.page(backgroundDisplayMode: .always))
      
    }
  }
  
  private func buttonAction() {
    withAnimation {
      if selectedView < 2 {
        selectedView += 1
      } else {
        selectedView = 0
      }
    }
  }
}

#Preview {
    OnboardingView()
}
