//
//  Phrase.swift
//  Adage
//
//  Created by Cem Aksoy on 25.11.2025.
//

import Foundation
import SwiftData

@Model
class Phrase {
  var learned: String
  var context: PhraseContext
  var exampleSentence: String
  var isMarked: Bool
  
  init(learned: String = "", context: PhraseContext = .daily, exampleSentence: String = "", isMarked: Bool = false) {
    self.learned = learned
    self.context = context
    self.exampleSentence = exampleSentence
    self.isMarked = isMarked
  }
}



extension Phrase {
  @MainActor
  static var preview: ModelContainer {
    guard let container = try? ModelContainer(for: Phrase.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)) else {
      fatalError("Failed to create preview storage!")
    }
    container.mainContext.insert(Phrase(learned: "aus etwas Thema machen", context: .daily, exampleSentence: "Ich möchte daraus kein Thema machen.", isMarked: false))
    container.mainContext.insert(Phrase(learned: "das Wort im Mund rumdrehen", context: .daily, exampleSentence: "Du drehst mir das Wort im Mund rum.", isMarked: true))
    container.mainContext.insert(Phrase(learned: "sich bei jemandem melden", context: .business, exampleSentence: "Ich melde mich bei Ihnen.", isMarked: true))
    container.mainContext.insert(Phrase(learned: "vielen Dank im Voraus", context: .academic, exampleSentence: "Vielen Dank im Voraus für Ihre Rückmeldung", isMarked: false))
    return container
  }
}


