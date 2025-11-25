//
//  Phrase.swift
//  Adage
//
//  Created by Cem Aksoy on 25.11.2025.
//

import Foundation

class Phrase {
  var learned: String
  var context: PhraseContext
  var exampleSentence: String
  
  init(learned: String = "", context: PhraseContext = .daily, exampleSentence: String = "") {
    self.learned = learned
    self.context = context
    self.exampleSentence = exampleSentence
  }
}
