//
//  ScoreEntrySheet.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// The "action sheet with a scrollable number wheel" from the pitch —
/// picks one turn's point delta for one player.
///
/// Scoped to non-negative deltas (0...150) for now, which covers
/// normal Scrabble-style turns; a game with penalty/negative scoring
/// isn't representable yet.
struct ScoreEntrySheet: View {
    let player: PlayerProfile
    let onAdd: (Int) -> Void

    @Environment(\.dismiss) private var dismiss
    let numbers = Array(stride(from: 150, through: -150, by: -1))
    @State private var value = 1

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("\(player.name)'s turn")
                    .font(.headline)
                    .padding(.top, 20)
                Picker("Points", selection: $value) {
                    ForEach(numbers, id: \.self) { points in
                        Text("\(points)").tag(points)
                    }
                }
                .pickerStyle(.wheel)
                .labelsHidden()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Add points") {
                        onAdd(value)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: player.colorHex))
                }
            }
            .presentationDetents([.height(280)])
        }
    }
}

#Preview {
    Color.clear.sheet(isPresented: .constant(true)) {
        ScoreEntrySheet(player: PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]), onAdd: { _ in })
    }
}
