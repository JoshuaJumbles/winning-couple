//
//  GameSessionSummary.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

/// A finished session as shown in the Game Detail list — built from
/// whichever of the three session models actually backs this game,
/// so the view doesn't need to know which one it is.
struct GameSessionSummary: Identifiable {
    let id: UUID
    let date: Date
    let resultText: String
    let hasNote: Bool
    let hasPhoto: Bool
}

/// One point on the win-history graph: how many wins each player had
/// after this session, for a competitive game.
struct WinHistoryPoint: Identifiable {
    let id: UUID
    let sessionIndex: Int
    let playerOneWins: Int
    let playerTwoWins: Int
}

/// The couple's cumulative record against a cooperative game.
struct CoopRecord {
    let wins: Int
    let losses: Int
}
