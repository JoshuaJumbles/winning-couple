//
//  CoopWinLossSession.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

/// A played session of a cooperative ``GameType`` (e.g. Pandemic) —
/// the couple plays as a team against the game itself, so there's a
/// single win/loss outcome rather than a per-player one.
///
/// `finishedDate` is nil until the post-game notes/photo step is
/// completed; once set, the session counts toward the game's record.
@Model
final class CoopWinLossSession {
    @Attribute(.unique) var id: UUID
    var gameTypeID: UUID
    var sessionDate: Date
    var finishedDate: Date?
    var didWin: Bool
    var notes: String?
    var photoData: Data?

    init(
        id: UUID = UUID(),
        gameTypeID: UUID,
        sessionDate: Date = .now,
        finishedDate: Date? = nil,
        didWin: Bool,
        notes: String? = nil,
        photoData: Data? = nil
    ) {
        self.id = id
        self.gameTypeID = gameTypeID
        self.sessionDate = sessionDate
        self.finishedDate = finishedDate
        self.didWin = didWin
        self.notes = notes
        self.photoData = photoData
    }
}
