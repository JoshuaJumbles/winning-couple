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

struct ScoreEntrySheet: View {
    let player: PlayerProfile
    let onAdd: (Int) -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var value = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("\(player.name)'s turn")
                    .font(.headline)
                Picker("Points", selection: $value) {
                    ForEach((-150...150).reversed(), id: \.self) { points in
                        Text("\(points > 0 ? "+" : "")\(points)").tag(points)
                    }
                }
                .pickerStyle(.wheel)
                .labelsHidden()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") { dismiss() }
                                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        onAdd(value)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: player.colorHex))
                }
            }
            .presentationDetents([.height(260)])
        }
    }
}

#Preview {
    Color.clear.sheet(isPresented: .constant(true)) {
        ScoreEntrySheet(player: PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]), onAdd: { _ in })
    }
}
