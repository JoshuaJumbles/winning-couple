//
//  ScoreTurn.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

/// One turn's point delta within a ``ScoringSession``, e.g. "Jordan +32".
/// Kept as its own row (rather than an array embedded in the session)
/// so a single bad entry can be edited or deleted without rewriting
/// the whole session.
@Model
final class ScoreTurn {
    @Attribute(.unique) var id: UUID
    var sessionID: UUID
    var playerID: UUID
    var delta: Int

    /// Ordering within the session; turns aren't guaranteed to sort
    /// by `createdAt` alone once edits are allowed.
    var turnIndex: Int
    var createdAt: Date

    init(
        id: UUID = UUID(),
        sessionID: UUID,
        playerID: UUID,
        delta: Int,
        turnIndex: Int,
        createdAt: Date = .now
    ) {
        self.id = id
        self.sessionID = sessionID
        self.playerID = playerID
        self.delta = delta
        self.turnIndex = turnIndex
        self.createdAt = createdAt
    }
}
