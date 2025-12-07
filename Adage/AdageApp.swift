//
//  AdageApp.swift
//  Adage
//
//  Created by Cem Aksoy on 24.11.2025.
//

import SwiftUI
import SwiftData

@main
struct AdageApp: App {
  var body: some Scene {
    WindowGroup {
      PhraseListView()
    }
    .modelContainer(for: Phrase.self)
  }
}
