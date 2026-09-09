//
//  GameType.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

/// Whether a game is played head-to-head or as a couple against the
/// game itself.
enum GameCategory: String, Codable, CaseIterable {
    case competitive
    case cooperative
}

/// How a session of this game is scored.
///
/// - Note: Today only three (category, scoringStyle) combinations have
///   a matching session model: `competitive`+`points` -> ``ScoringSession``,
///   `competitive`+`winLoss` -> ``WinLossSession``, and `cooperative`+`winLoss`
///   -> ``CoopWinLossSession``. `cooperative`+`points` isn't representable
///   yet — the game-type editor should steer cooperative games to
///   win/loss scoring until (if) a cooperative points session is added.
enum ScoringStyle: String, Codable, CaseIterable {
    case points
    case winLoss
}

/// A game the couple plays, e.g. "Scrabble" or "Pandemic". Holds the
/// game's configuration; the sessions played under it live in their
/// own models (``ScoringSession``, ``WinLossSession``,
/// ``CoopWinLossSession``), each referencing this game type by `id`.
@Model
final class GameType {
    @Attribute(.unique) var id: UUID
    var title: String
    var category: GameCategory
    var scoringStyle: ScoringStyle
    var thumbnailData: Data?
    var createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        category: GameCategory,
        scoringStyle: ScoringStyle,
        thumbnailData: Data? = nil,
        createdAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.scoringStyle = scoringStyle
        self.thumbnailData = thumbnailData
        self.createdAt = createdAt
    }
}
