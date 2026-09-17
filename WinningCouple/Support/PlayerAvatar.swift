//
//  PlayerAvatar.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/17/26.
//

import SwiftUI

/// The player's circle, used everywhere a player is represented: their
/// emoji if they've picked one, otherwise the first letter of their
/// name.
struct PlayerAvatar: View {
    enum Style {
        /// On a neutral surface: the circle carries the player's color.
        case filled
        /// On top of the player's color already (a winner card, the
        /// celebration banner): a translucent white circle instead, so
        /// it doesn't disappear into the background.
        case onAccent
    }

    let name: String
    let emoji: String?
    let colorHex: String
    var size: CGFloat = 44
    var style: Style = .filled

    var body: some View {
        Circle()
            .fill(fill)
            .frame(width: size, height: size)
            .overlay {
                if let emoji {
                    Text(emoji)
                        .font(.system(size: size * 0.56))
                } else {
                    Text(initial)
                        .font(.system(size: size * 0.42, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
            .accessibilityElement()
            .accessibilityLabel(name)
    }

    private var fill: Color {
        switch style {
        case .onAccent:
            return .white.opacity(0.24)
        case .filled:
            // White text needs the solid color for contrast; an emoji
            // reads better on a lighter tint of it.
            let color = Color(hex: colorHex)
            return emoji == nil ? color : color.opacity(0.22)
        }
    }

    private var initial: String {
        String(name.prefix(1)).uppercased()
    }
}

extension PlayerAvatar {
    init(player: PlayerProfile, size: CGFloat = 44, style: Style = .filled) {
        self.init(name: player.name, emoji: player.emoji, colorHex: player.colorHex, size: size, style: style)
    }
}

#Preview {
    VStack(spacing: 16) {
        HStack(spacing: 16) {
            PlayerAvatar(name: "Jordan", emoji: nil, colorHex: PlayerColorPalette.swatches[4])
            PlayerAvatar(name: "Taylor", emoji: "🦊", colorHex: PlayerColorPalette.swatches[2])
            PlayerAvatar(name: "Taylor", emoji: "🦊", colorHex: PlayerColorPalette.swatches[2], size: 84)
        }
        HStack(spacing: 16) {
            PlayerAvatar(name: "Jordan", emoji: nil, colorHex: PlayerColorPalette.swatches[4], size: 56, style: .onAccent)
            PlayerAvatar(name: "Taylor", emoji: "🎲", colorHex: PlayerColorPalette.swatches[2], size: 56, style: .onAccent)
        }
        .padding()
        .background(Color(hex: PlayerColorPalette.swatches[4]))
    }
}
