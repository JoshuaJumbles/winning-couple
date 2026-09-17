//
//  PlayerEmojiPalette.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/17/26.
//

import Foundation

/// The curated emoji offered first on the avatar picker — the quick,
/// no-search default. Anything outside this set is still reachable
/// through the picker's "More" tile, which opens the system emoji
/// keyboard.
///
/// Deliberately skewed toward emoji with no skin-tone variants, so the
/// curated grid never has to offer (or guess at) a tone; people and
/// hand emoji are still available through the system keyboard, which
/// handles tones natively.
enum PlayerEmojiPalette {
    static let curated: [String] = [
        // Game pieces
        "🎲", "♟️", "🃏", "🎯", "🏆", "🥇", "🎮", "🧩",
        // Animals
        "🦊", "🐯", "🐻", "🐼", "🐨", "🦁", "🐸", "🐙", "🦉", "🐧", "🦄", "🐢",
        // Faces
        "😎", "🤓", "🥳", "😈", "👻", "🤠", "🤖", "👽",
        // Food
        "🍕", "🌮", "🍩", "🍓", "🥑", "☕️",
        // Everything else
        "🚀", "🔥", "⭐️", "🌈", "💎", "🌵", "🎸", "⚡️",
    ]

    /// The last emoji in `text`, or `nil` if it contains none.
    ///
    /// "Last" rather than "first" because input can arrive with
    /// leftovers ahead of the new character, and the newest pick is the
    /// one the player meant. Works per grapheme, so multi-scalar emoji
    /// (flags, keycaps, ZWJ families, skin tones) come back whole.
    static func lastEmoji(in text: String) -> String? {
        text.last(where: \.isEmoji).map(String.init)
    }
}

extension Character {
    /// Whether this grapheme renders as an emoji.
    ///
    /// Unicode's `isEmoji` property alone is too loose: plain digits,
    /// `#`, `*`, and symbols like "©" all carry it, even though they
    /// render as text. So a single scalar only counts if it defaults to
    /// emoji presentation. Anything with more scalars counts if it
    /// starts with an emoji-capable scalar — that covers variation
    /// selectors ("☕️"), keycaps ("1️⃣"), skin tones, and ZWJ sequences.
    var isEmoji: Bool {
        guard let first = unicodeScalars.first else { return false }
        return first.properties.isEmojiPresentation
            || (first.properties.isEmoji && unicodeScalars.count > 1)
    }
}
