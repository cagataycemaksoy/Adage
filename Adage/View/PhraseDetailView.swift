//
//  PhraseDetailView.swift
//  Adage
//
//  Created by Cem Aksoy on 26.11.2025.
//

import SwiftUI
import SwiftData

struct PhraseDetailView: View {
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss
  
  @State var phrase: Phrase
  @State private var title = ""
  @State private var context = PhraseContext.daily
  @State private var exampleSentence = ""
  @State private var isMarked = false
  
  
  var body: some View {
    VStack(alignment: .leading) {
      
      Text("Phrase:")
        .font(Font.custom("Georgia", size: 22))
        .bold()
      
      TextField("The phrase ...", text: $title)
        .textFieldStyle(.roundedBorder)
        .font(Font.custom("Georgia", size: 20))
        .padding(.bottom, 30)
      
      
      Text("Example Sentence: ")
        .font(Font.custom("Georgia", size: 22))
        .bold()
      
      TextField("Example sentence...", text: $exampleSentence, axis: .vertical)
        .textFieldStyle(.roundedBorder)
        .font(Font.custom("Georgia", size: 20))
        .padding(.bottom, 30)
      
      Picker("Context of the phrase", selection: $context) {
        ForEach(PhraseContext.allCases, id: \.self) { context in
          Text(context.rawValue)
            .font(Font.custom("Georgia", size: 20))
        }
      }
      .pickerStyle(.segmented)
      .padding(.bottom, 30)
      
      HStack {
        Text(isMarked ? "Bookmarked" : "Bookmark")
          .font(Font.custom("Georgia", size: 22))
          .bold()
        
        Spacer()
        
        Image(systemName: isMarked ? "bookmark.fill" : "bookmark")
          .font(.title3)
          .frame(width: 35, height: 35)
          .overlay {
            Circle()
              .stroke(.black, lineWidth: 1.5)
          }
          .onTapGesture {
            isMarked.toggle()
          }
        
          .padding(.trailing, 30)
      }
      
      
      
      
      //TODO: Add button with pressen animation to save and cancel
      //TODO: For each button add seperate sounds and haptic feedback
      Spacer()
    }
    .padding(.horizontal)
    
    .onAppear {
      title = phrase.learned
      context = phrase.context
      exampleSentence = phrase.exampleSentence
      isMarked = phrase.isMarked
    }
  }
}

#Preview {
  let phrase = Phrase(learned: "das Wort im Mund rumdrehen", context: .daily, exampleSentence: "Du drehst mir das Wort im Mund rum.", isMarked: true)
    PhraseDetailView(phrase: phrase)
    .modelContainer(for: Phrase.self, inMemory: true)
}
