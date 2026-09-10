//
//  ScoringSessionRepositoryProtocol.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

protocol ScoringSessionRepositoryProtocol {
    /// Finished sessions for a game, oldest first.
    func fetchFinished(gameTypeID: UUID) async throws -> [ScoringSession]
    /// Every turn logged for one session, in turn order.
    func fetchTurns(sessionID: UUID) async throws -> [ScoreTurn]
}
