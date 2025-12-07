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
  @Environment(\.modelContext) private var modelContext
  @State private var sheetPresented = false
  
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
              
              Image(systemName: phrase.isMarked ? "bookmark.fill" : "bookmark")
            }
          }
          .swipeActions {
            Button("", systemImage: "trash", role: .destructive) {
              modelContext.delete(phrase)
              guard let _ = try? modelContext.save() else {
                print("😡 Failed to delete the data!")
                return
              }
            }
          }
        }
        .navigationTitle("Phrases")
        .sheet(isPresented: $sheetPresented) {
          NavigationStack {
            PhraseDetailView(phrase: Phrase())
          }
        }
        .toolbar{
          ToolbarItem(placement: .topBarTrailing) {
            Button("Add", systemImage: "plus") {
              sheetPresented = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
          }
        }
        
      }
    }
}

#Preview {
    PhraseListView()
    .modelContainer(Phrase.preview)
}
