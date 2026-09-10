//
//  SettingsViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class SettingsViewModel {
    private(set) var players: [PlayerProfile] = []
    var errorMessage: String?

    private let playerRepository: PlayerRepositoryProtocol

    init(playerRepository: PlayerRepositoryProtocol) {
        self.playerRepository = playerRepository
    }

    func load() async {
        do {
            players = try await playerRepository.fetchAll()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func makeEditPlayerViewModel(for player: PlayerProfile) -> EditPlayerViewModel {
        EditPlayerViewModel(player: player, playerRepository: playerRepository) { [weak self] in
            await self?.load()
        }
    }
}
