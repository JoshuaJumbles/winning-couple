//
//  GameListViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class GameListViewModel {
    private(set) var competitiveGames: [GameType] = []
    private(set) var cooperativeGames: [GameType] = []
    var errorMessage: String?
    var isPresentingAddGame = false

    private let gameTypeRepository: GameTypeRepositoryProtocol

    init(gameTypeRepository: GameTypeRepositoryProtocol) {
        self.gameTypeRepository = gameTypeRepository
    }

    var hasNoGames: Bool {
        competitiveGames.isEmpty && cooperativeGames.isEmpty
    }

    func load() async {
        do {
            let games = try await gameTypeRepository.fetchAll()
            competitiveGames = games.filter { $0.category == .competitive }
            cooperativeGames = games.filter { $0.category == .cooperative }
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func makeAddGameTypeViewModel() -> AddGameTypeViewModel {
        AddGameTypeViewModel(gameTypeRepository: gameTypeRepository) { [weak self] in
            self?.isPresentingAddGame = false
            await self?.load()
        }
    }
}
