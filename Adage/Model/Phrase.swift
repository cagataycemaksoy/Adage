//
//  Phrase.swift
//  Adage
//
//  Created by Cem Aksoy on 25.11.2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class Phrase {
  var learned: String
  var context: PhraseContext
  var exampleSentence: [String]
  
  init(learned: String = "", context: PhraseContext = .daily, exampleSentence: [String] = []) {
    self.learned = learned
    self.context = context
    self.exampleSentence = exampleSentence
  }
}




extension Phrase {
  static var preview: ModelContainer {
    guard let container = try? ModelContainer(for: Phrase.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)) else {
      fatalError("Failed to create preview storage!")
    }
    container.mainContext.insert(Phrase(learned: "aus etwas Thema machen", context: .daily, exampleSentence: ["Ich möchte daraus kein Thema machen."]))
    container.mainContext.insert(Phrase(learned: "das Wort im Mund rumdrehen", context: .daily, exampleSentence: ["Du drehst mir das Wort im Mund rum."]))
    container.mainContext.insert(Phrase(learned: "sich bei jemandem melden", context: .business, exampleSentence: ["Ich melde mich bei Ihnen."]))
    container.mainContext.insert(Phrase(learned: "vielen Dank im Voraus", context: .academic, exampleSentence: ["Vielen Dank im Voraus für Ihre Rückmeldung"]))
    return container
  }
}
