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
    var saveError: Error?
    var addTurnError: Error?

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

    func save(_ session: ScoringSession) async throws {
        if let saveError { throw saveError }
        if let index = sessions.firstIndex(where: { $0.id == session.id }) {
            sessions[index] = session
        } else {
            sessions.append(session)
        }
    }

    func addTurn(_ turn: ScoreTurn) async throws {
        if let addTurnError { throw addTurnError }
        turns.append(turn)
    }

    func deleteTurn(_ turn: ScoreTurn) async throws {
        turns.removeAll { $0.id == turn.id }
    }
}
