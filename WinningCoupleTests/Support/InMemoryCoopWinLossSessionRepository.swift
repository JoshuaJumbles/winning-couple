//
//  InMemoryCoopWinLossSessionRepository.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
@testable import WinningCouple

final class InMemoryCoopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol {
    private(set) var sessions: [CoopWinLossSession]

    init(sessions: [CoopWinLossSession] = []) {
        self.sessions = sessions
    }

    func fetchFinished(gameTypeID: UUID) async throws -> [CoopWinLossSession] {
        sessions
            .filter { $0.gameTypeID == gameTypeID && $0.finishedDate != nil }
            .sorted { $0.sessionDate < $1.sessionDate }
    }
}
