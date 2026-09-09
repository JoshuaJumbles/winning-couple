//
//  ScoringSession.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

/// A played session of a points-scored, competitive ``GameType``
/// (e.g. Scrabble). The turn-by-turn deltas live separately as
/// ``ScoreTurn`` rows referencing this session's `id`.
///
/// `finishedDate` is nil while the session is still being scored live;
/// once set, the session counts toward the game's win history.
@Model
final class ScoringSession {
    @Attribute(.unique) var id: UUID
    var gameTypeID: UUID
    var sessionDate: Date
    var finishedDate: Date?
    var notes: String?
    var photoData: Data?

    init(
        id: UUID = UUID(),
        gameTypeID: UUID,
        sessionDate: Date = .now,
        finishedDate: Date? = nil,
        notes: String? = nil,
        photoData: Data? = nil
    ) {
        self.id = id
        self.gameTypeID = gameTypeID
        self.sessionDate = sessionDate
        self.finishedDate = finishedDate
        self.notes = notes
        self.photoData = photoData
    }
}
