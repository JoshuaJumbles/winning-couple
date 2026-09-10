//
//  GameTypeRepositoryProtocol.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@MainActor
protocol GameTypeRepositoryProtocol {
    func fetchAll() async throws -> [GameType]
    func save(_ gameType: GameType) async throws
}
