//
//  PlayerColorPalette.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// The curated set of swatches offered on the player color picker
/// (onboarding, and later Settings). Hex strings so they stay
/// trivially `Codable` on `PlayerProfile` — see `Color(hex:)` below
/// for turning one back into a SwiftUI `Color`.
enum PlayerColorPalette {
    static let swatches: [String] = [
        "#FF6F5E", // coral
        "#E3A542", // amber
        "#4FA69C", // teal
        "#5A84D6", // blue
        "#9868C9", // violet
        "#E8749B", // rose
        "#7BB57C", // sage
    ]

    static let `default`: String = swatches[0]

    // Semantic colors for cooperative outcomes, which aren't tied to
    // either player. Just two of the same swatches, named for reuse.
    static let coopWin: String = swatches[6]  // sage
    static let coopLoss: String = swatches[5] // rose
}

extension Color {
    /// Best-effort parse of a "#RRGGBB" (or "RRGGBB") string. Falls
    /// back to the default palette color for anything malformed —
    /// this is a UI convenience, not a validator.
    init(hex: String) {
        let digits = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        guard digits.count == 6, let value = UInt32(digits, radix: 16) else {
            self.init(red: 0.5, green: 0.5, blue: 0.5)
            return
        }
        let r = Double((value >> 16) & 0xFF) / 255
        let g = Double((value >> 8) & 0xFF) / 255
        let b = Double(value & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
