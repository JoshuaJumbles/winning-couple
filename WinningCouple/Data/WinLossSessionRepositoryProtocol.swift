//
//  WinLossSessionRepositoryProtocol.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

protocol WinLossSessionRepositoryProtocol {
    /// Finished sessions for a game, oldest first.
    func fetchFinished(gameTypeID: UUID) async throws -> [WinLossSession]
}
