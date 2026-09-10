//
//  InMemoryWinLossSessionRepository.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
@testable import WinningCouple

final class InMemoryWinLossSessionRepository: WinLossSessionRepositoryProtocol {
    private(set) var sessions: [WinLossSession]

    init(sessions: [WinLossSession] = []) {
        self.sessions = sessions
    }

    func fetchFinished(gameTypeID: UUID) async throws -> [WinLossSession] {
        sessions
            .filter { $0.gameTypeID == gameTypeID && $0.finishedDate != nil }
            .sorted { $0.sessionDate < $1.sessionDate }
    }
}
