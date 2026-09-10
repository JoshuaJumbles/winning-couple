//
//  CoopWinLossSessionRepositoryProtocol.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

protocol CoopWinLossSessionRepositoryProtocol {
    /// Finished sessions for a game, oldest first.
    func fetchFinished(gameTypeID: UUID) async throws -> [CoopWinLossSession]
    func save(_ session: CoopWinLossSession) async throws
}
