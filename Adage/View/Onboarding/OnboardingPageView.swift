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
  
  let buttonAction: () -> Void
  
    var body: some View {
      ZStack {
        LinearGradient(colors: [.color1.opacity(0.4), .color1.opacity(0.5)],
                       startPoint: .topLeading,
                       endPoint: .bottom)
        .ignoresSafeArea()
        
        VStack {
          Spacer()
          
          Text(title)
            .font(Font.custom("Georgia", size: 38))
            .multilineTextAlignment(.center)
            .padding()
          
          Spacer()
          
          Image(imgString)
            .resizable()
            .aspectRatio(contentMode: .fit)
          //TODO: Use GeoReader proxy for the frame height
            .frame(height: 250)
            .padding(.bottom, 30)
          
          Text(description)
            .font(Font.custom("Georgia", size: 20))
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .frame(width: 320)
            .padding(.bottom, 30)
          
          Button(lastView ? "Get Started" : "Next", action: buttonAction)
            .tint(.black)
            .buttonStyle(.bordered)
            .scaleEffect(1.3)
            .padding(.vertical)
          
          Spacer()
          Spacer()
        }
        
        
      }
    }
}

#Preview {
  OnboardingPageView(title: "Welcome to \n Adage!", imgString: "img0", description: "Learn the language by studying real world phrases.", lastView: false, buttonAction: {})
}
