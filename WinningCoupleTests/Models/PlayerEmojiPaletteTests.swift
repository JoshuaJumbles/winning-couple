//
//  PlayerEmojiPaletteTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/17/26.
//

import Testing
@testable import WinningCouple

struct PlayerEmojiPaletteTests {
    @Test func acceptsASingleEmoji() {
        #expect(PlayerEmojiPalette.lastEmoji(in: "🦊") == "🦊")
    }

    @Test func rejectsPlainText() {
        #expect(PlayerEmojiPalette.lastEmoji(in: "") == nil)
        #expect(PlayerEmojiPalette.lastEmoji(in: "a") == nil)
        #expect(PlayerEmojiPalette.lastEmoji(in: "Jordan") == nil)
    }

    /// Digits, `#`, and "©" all carry Unicode's `isEmoji` property, but
    /// render as text on their own.
    @Test func rejectsTextThatOnlyTechnicallyHasTheEmojiProperty() {
        #expect(PlayerEmojiPalette.lastEmoji(in: "1") == nil)
        #expect(PlayerEmojiPalette.lastEmoji(in: "#") == nil)
        #expect(PlayerEmojiPalette.lastEmoji(in: "©") == nil)
    }

    @Test func keepsMultiScalarEmojiWhole() {
        #expect(PlayerEmojiPalette.lastEmoji(in: "1️⃣") == "1️⃣")          // keycap
        #expect(PlayerEmojiPalette.lastEmoji(in: "☕️") == "☕️")          // variation selector
        #expect(PlayerEmojiPalette.lastEmoji(in: "👋🏽") == "👋🏽")          // skin tone
        #expect(PlayerEmojiPalette.lastEmoji(in: "🇨🇦") == "🇨🇦")          // flag
        #expect(PlayerEmojiPalette.lastEmoji(in: "👨‍👩‍👧") == "👨‍👩‍👧")    // ZWJ sequence
    }

    @Test func takesTheNewestEmojiWhenThereIsLeftoverInput() {
        #expect(PlayerEmojiPalette.lastEmoji(in: "hi 🦊") == "🦊")
        #expect(PlayerEmojiPalette.lastEmoji(in: "🎲🦊") == "🦊")
    }

    @Test func curatedSetIsAllSingleUniqueEmoji() {
        let curated = PlayerEmojiPalette.curated
        #expect(Set(curated).count == curated.count)
        for emoji in curated {
            #expect(emoji.count == 1, "\(emoji) should be a single grapheme")
            #expect(PlayerEmojiPalette.lastEmoji(in: emoji) == emoji, "\(emoji) should validate as an emoji")
        }
    }
}
