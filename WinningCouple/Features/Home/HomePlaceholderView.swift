//
//  HomePlaceholderView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// Stands in for the game-list Main screen until that PR lands.
/// Confirms onboarding is behind us by naming the two players it saved.
struct HomePlaceholderView: View {
    let players: [PlayerProfile]

    var body: some View {
        VStack(spacing: 8) {
            Text("Winning Couple")
                .font(.largeTitle.bold())
            if players.isEmpty {
                Text("Game list coming soon.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } else {
                Text(players.map(\.name).formatted(.list(type: .and)))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("Game list coming soon.")
                    .font(.footnote)
                    .foregroundStyle(.tertiary)
            }
        }
        .padding()
    }
}

#Preview {
    HomePlaceholderView(players: [
        PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
        PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
    ])
}
