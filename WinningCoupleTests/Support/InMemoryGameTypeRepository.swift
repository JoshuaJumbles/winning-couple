//
//  InMemoryGameTypeRepository.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
@testable import WinningCouple

final class InMemoryGameTypeRepository: GameTypeRepositoryProtocol {
    private(set) var gameTypes: [GameType]
    var saveError: Error?
    var fetchError: Error?

    init(gameTypes: [GameType] = []) {
        self.gameTypes = gameTypes
    }

    func fetchAll() async throws -> [GameType] {
        if let fetchError { throw fetchError }
        return gameTypes
    }

    func save(_ gameType: GameType) async throws {
        if let saveError { throw saveError }
        gameTypes.append(gameType)
    }
}
