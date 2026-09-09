//
//  GameDetailPlaceholderView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// Stands in for the real game detail screen (win-history graph, session
/// list, "Score a New Session") until that PR lands.
struct GameDetailPlaceholderView: View {
    let gameType: GameType

    var body: some View {
        VStack(spacing: 8) {
            Text(gameType.title)
                .font(.title.bold())
            Text("Session history coming soon.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle(gameType.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GameDetailPlaceholderView(gameType: GameType(title: "Scrabble", category: .competitive, scoringStyle: .points))
    }
}
