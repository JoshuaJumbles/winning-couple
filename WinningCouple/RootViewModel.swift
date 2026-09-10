//
//  RootViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class RootViewModel {
    enum Phase {
        case loading
        case onboarding
        case home
    }

    private(set) var phase: Phase = .loading
    private let playerRepository: PlayerRepositoryProtocol
    private let gameTypeRepository: GameTypeRepositoryProtocol
    private let scoringSessionRepository: ScoringSessionRepositoryProtocol
    private let winLossSessionRepository: WinLossSessionRepositoryProtocol
    private let coopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol

    init(
        playerRepository: PlayerRepositoryProtocol,
        gameTypeRepository: GameTypeRepositoryProtocol,
        scoringSessionRepository: ScoringSessionRepositoryProtocol,
        winLossSessionRepository: WinLossSessionRepositoryProtocol,
        coopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol
    ) {
        self.playerRepository = playerRepository
        self.gameTypeRepository = gameTypeRepository
        self.scoringSessionRepository = scoringSessionRepository
        self.winLossSessionRepository = winLossSessionRepository
        self.coopWinLossSessionRepository = coopWinLossSessionRepository
    }

    /// Two players configured during onboarding means onboarding is
    /// done; anything less and we send the player back through it.
    func loadPhase() async {
        let players = (try? await playerRepository.fetchAll()) ?? []
        phase = players.count >= 2 ? .home : .onboarding
    }

    func makeOnboardingViewModel() -> OnboardingViewModel {
        OnboardingViewModel(playerRepository: playerRepository)
    }

    func makeGameListViewModel() -> GameListViewModel {
        GameListViewModel(
            gameTypeRepository: gameTypeRepository,
            playerRepository: playerRepository,
            scoringSessionRepository: scoringSessionRepository,
            winLossSessionRepository: winLossSessionRepository,
            coopWinLossSessionRepository: coopWinLossSessionRepository
        )
    }

    func onboardingFinished() async {
        await loadPhase()
    }
}
