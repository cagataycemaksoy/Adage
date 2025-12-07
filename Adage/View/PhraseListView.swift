//
//  PhraseListView.swift
//  Adage
//
//  Created by Cem Aksoy on 24.11.2025.
//

import SwiftUI
import SwiftData

struct PhraseListView: View {
  @Query private var phrases: [Phrase]
  
    var body: some View {
      NavigationStack {
        List(phrases) { phrase in
          NavigationLink {
            PhraseDetailView(phrase: phrase)
          } label: {
            HStack {
              Text(phrase.learned)
                .font(Font.custom("Georgia", size: 18))
                .minimumScaleFactor(0.7)
                .lineLimit(1)
              
              Spacer()
              
              Image(systemName: phrase.isMarked ? "bookmark" : "bookmark.fill")
                
            }
          }

        }
        .navigationTitle("Phrases")
        
      }
    }
}

#Preview {
    PhraseListView()
    .modelContainer(Phrase.preview)
}
