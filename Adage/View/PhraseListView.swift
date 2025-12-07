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
            Text(phrase.learned)
          }

        }
      }
    }
}

#Preview {
    PhraseListView()
    .modelContainer(Phrase.preview)
}
