//
//  ScoreSessionPlaceholderView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// Stands in for the real live-scoring flow (points turn log, win/loss
/// tap screen, and the post-game notes/photo step) until those PRs land.
struct ScoreSessionPlaceholderView: View {
    let gameType: GameType
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                Text("Live scoring for \(gameType.title)")
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)
                Text("Coming soon.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    ScoreSessionPlaceholderView(gameType: GameType(title: "Scrabble", category: .competitive, scoringStyle: .points))
}
