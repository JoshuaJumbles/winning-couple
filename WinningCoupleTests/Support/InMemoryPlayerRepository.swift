//
//  InMemoryPlayerRepository.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
@testable import WinningCouple

final class InMemoryPlayerRepository: PlayerRepositoryProtocol {
    private(set) var players: [PlayerProfile]
    var saveError: Error?
    var fetchError: Error?

    init(players: [PlayerProfile] = []) {
        self.players = players
    }

    func fetchAll() async throws -> [PlayerProfile] {
        if let fetchError { throw fetchError }
        return players
    }

    func save(_ player: PlayerProfile) async throws {
        if let saveError { throw saveError }
        players.append(player)
    }
}
