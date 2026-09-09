//
//  WinLossSession.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

/// A played session of a win/loss, competitive ``GameType`` (e.g.
/// Chess) — one player beat the other, no running score to track.
///
/// `finishedDate` is nil until the post-game notes/photo step is
/// completed; once set, the session counts toward the game's win
/// history.
@Model
final class WinLossSession {
    @Attribute(.unique) var id: UUID
    var gameTypeID: UUID
    var sessionDate: Date
    var finishedDate: Date?
    var winnerPlayerID: UUID
    var notes: String?
    var photoData: Data?

    init(
        id: UUID = UUID(),
        gameTypeID: UUID,
        sessionDate: Date = .now,
        finishedDate: Date? = nil,
        winnerPlayerID: UUID,
        notes: String? = nil,
        photoData: Data? = nil
    ) {
        self.id = id
        self.gameTypeID = gameTypeID
        self.sessionDate = sessionDate
        self.finishedDate = finishedDate
        self.winnerPlayerID = winnerPlayerID
        self.notes = notes
        self.photoData = photoData
    }
}
