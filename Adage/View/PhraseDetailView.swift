//
//  PhraseDetailView.swift
//  Adage
//
//  Created by Cem Aksoy on 26.11.2025.
//

import SwiftUI
import SwiftData

struct PhraseDetailView: View {
  @Environment(\.modelContext) private var modelContext
  @Environment(\.dismiss) var dismiss
  
  @State var phrase: Phrase
  @State private var title = ""
  @State private var context = PhraseContext.daily
  @State private var exampleSentence = ""
  @State private var isMarked = false
  
  @State private var isAnimated = false
  @State private var scaleFactor = 1.0
  
  var body: some View {
    VStack(alignment: .leading) {
      
      Text("Phrase:")
        .font(Font.custom("Georgia", size: 22))
        .bold()
        .padding(.top)
      
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
        }
      }
      .pickerStyle(.segmented)
      .padding(.bottom, 30)
      
      Group {
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
      }
      
      HStack {
        Text(isMarked ? "Bookmarked" : "Bookmark")
          .font(Font.custom("Georgia", size: 22))
          .bold()
        
        Spacer()
        
        Image(systemName: isMarked ? "bookmark.fill" : "bookmark")
          .font(.title3)
          .frame(width: 40, height: 40)
          .background {
            Circle()
              .stroke(.black, lineWidth: 1.5)
          }
          .scaleEffect(scaleFactor)
          .onTapGesture {
            isAnimated.toggle()
            withAnimation(.easeInOut(duration: 0.12)) {
              isMarked.toggle()
            }
          }
          .onChange(of: isAnimated) {
            scaleFactor = 0.8
            withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.2)) {
              scaleFactor = 1.0
            }
          }
          .padding(.trailing, 30)
      }
      
      Spacer()
    }
    .padding(.horizontal)
    .onAppear {
      title = phrase.learned
      context = phrase.context
      exampleSentence = phrase.exampleSentence
      isMarked = phrase.isMarked
    }
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .confirmationAction) {
        Button("Save", systemImage: "checkmark") {
          phrase.learned = title
          phrase.context = context
          phrase.exampleSentence = exampleSentence
          phrase.isMarked = isMarked
          modelContext.insert(phrase)
          guard let _ = try? modelContext.save() else {
            print("😡 Failed to save the data!")
            return
          }
          dismiss()
        }
        .tint(.black)
      }
      
      ToolbarItem(placement: .cancellationAction) {
        Button("Cancel", systemImage: "xmark") {
          dismiss()
        }
      }
      
    }
  }
}

#Preview {
  NavigationStack {
    let phrase = Phrase(learned: "das Wort im Mund rumdrehen", context: .daily, exampleSentence: "Du drehst mir das Wort im Mund rum.", isMarked: true)
      PhraseDetailView(phrase: phrase)
      .modelContainer(for: Phrase.self, inMemory: true)
  }
}
