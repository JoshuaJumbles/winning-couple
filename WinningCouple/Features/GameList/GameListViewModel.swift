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
    var isPresentingSettings = false

    private let gameTypeRepository: GameTypeRepositoryProtocol
    private let playerRepository: PlayerRepositoryProtocol
    private let scoringSessionRepository: ScoringSessionRepositoryProtocol
    private let winLossSessionRepository: WinLossSessionRepositoryProtocol
    private let coopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol

    init(
        gameTypeRepository: GameTypeRepositoryProtocol,
        playerRepository: PlayerRepositoryProtocol,
        scoringSessionRepository: ScoringSessionRepositoryProtocol,
        winLossSessionRepository: WinLossSessionRepositoryProtocol,
        coopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol
    ) {
        self.gameTypeRepository = gameTypeRepository
        self.playerRepository = playerRepository
        self.scoringSessionRepository = scoringSessionRepository
        self.winLossSessionRepository = winLossSessionRepository
        self.coopWinLossSessionRepository = coopWinLossSessionRepository
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

    func makeSettingsViewModel() -> SettingsViewModel {
        SettingsViewModel(playerRepository: playerRepository)
    }

    func makeGameDetailViewModel(for gameType: GameType) -> GameDetailViewModel {
        GameDetailViewModel(
            gameType: gameType,
            playerRepository: playerRepository,
            scoringSessionRepository: scoringSessionRepository,
            winLossSessionRepository: winLossSessionRepository,
            coopWinLossSessionRepository: coopWinLossSessionRepository
        )
    }
}
