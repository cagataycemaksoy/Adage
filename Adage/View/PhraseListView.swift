//
//  PhraseListView.swift
//  Adage
//
//  Created by Cem Aksoy on 24.11.2025.
//

import SwiftUI
import SwiftData

struct PhraseListView: View {
  enum ListSelectionOption: String, CaseIterable {
    case all = "All"
    case bookmarked = "Bookmarked"
  }
  
  @Query private var phrases: [Phrase]
  @Environment(\.modelContext) private var modelContext
  
  @State private var sheetPresented = false
  @State private var listSelection: ListSelectionOption = .all
  
  private var selectedList: [Phrase] {
    switch listSelection {
    case .all: return phrases
    case .bookmarked: return phrases.filter{ $0.isMarked }
    }
  }
  
    var body: some View {
      NavigationStack {
        
        VStack(alignment: .leading){
          Text("Phrases")
            .font(Font.custom("Georgia", size: 38))
            .bold()
          
          Picker("", selection: $listSelection) {
            ForEach(ListSelectionOption.allCases, id: \.self) { option in
              Text(option.rawValue)
            }
          }
          .pickerStyle(.segmented)
          .padding(.bottom)
          
          List(selectedList) { phrase in
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
          .listStyle(.plain)
        }
        .padding(.horizontal)
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
