//
//  PlayerProfile.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

/// One of the two people using the app. Created during onboarding and
/// edited from Settings; there are always exactly two of these, but
/// sessions reference a player by `id` rather than by position so the
/// data model doesn't hard-code that assumption.
@Model
final class PlayerProfile {
    @Attribute(.unique) var id: UUID
    var name: String

    /// Hex string (e.g. "#FF6F61"), not a `Color`, so this stays
    /// trivially Codable and portable to a future sync backend.
    var colorHex: String

    /// A single emoji the player picked as their avatar — their "game
    /// piece". Optional: `PlayerAvatar` falls back to the name's first
    /// letter when it's `nil`.
    var emoji: String?

    var createdAt: Date

    init(
        id: UUID = UUID(),
        name: String,
        colorHex: String,
        emoji: String? = nil,
        createdAt: Date = .now
    ) {
        self.id = id
        self.name = name
        self.colorHex = colorHex
        self.emoji = emoji
        self.createdAt = createdAt
    }
}
