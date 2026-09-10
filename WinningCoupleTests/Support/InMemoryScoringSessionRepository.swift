//
//  InMemoryScoringSessionRepository.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
@testable import WinningCouple

final class InMemoryScoringSessionRepository: ScoringSessionRepositoryProtocol {
    private(set) var sessions: [ScoringSession]
    private(set) var turns: [ScoreTurn]

    init(sessions: [ScoringSession] = [], turns: [ScoreTurn] = []) {
        self.sessions = sessions
        self.turns = turns
    }

    func fetchFinished(gameTypeID: UUID) async throws -> [ScoringSession] {
        sessions
            .filter { $0.gameTypeID == gameTypeID && $0.finishedDate != nil }
            .sorted { $0.sessionDate < $1.sessionDate }
    }

    func fetchTurns(sessionID: UUID) async throws -> [ScoreTurn] {
        turns
            .filter { $0.sessionID == sessionID }
            .sorted { $0.turnIndex < $1.turnIndex }
    }
}
