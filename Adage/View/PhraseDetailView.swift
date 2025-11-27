//
//  PhraseDetailView.swift
//  Adage
//
//  Created by Cem Aksoy on 26.11.2025.
//

import SwiftUI

struct PhraseDetailView: View {
  @State var phrase: Phrase
  @State private var title = ""
  @State private var context = PhraseContext.daily
  @State private var example = ""
  
  
    var body: some View {
      Form {
        TextField("The phrase ...", text: $title)
          .font(Font.custom("Georgia", size: 22))
          .textFieldStyle(.roundedBorder)
        
        Picker("Context of the phrase", selection: $context) {
          ForEach(PhraseContext.allCases, id: \.self) { context in
            Text(context.rawValue)
          }
        }
        .pickerStyle(.segmented)
        .listRowSeparator(.hidden)
        
        TextField("Example sentence...", text: $example, axis: .vertical)
          .font(Font.custom("Georgia", size: 20))
          .textFieldStyle(.roundedBorder)
        
        //TODO: Add button with pressen animation to save and cancel
        //TODO: For each button add seperate sounds and haptic feedback
      }
    }
}

#Preview {
  let phrase = Phrase(learned: "das Wort im Mund rumdrehen", context: .daily, exampleSentence: ["Du drehst mir das Wort im Mund rum."])
  
    PhraseDetailView(phrase: phrase)
}
