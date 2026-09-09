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

    init(playerRepository: PlayerRepositoryProtocol, gameTypeRepository: GameTypeRepositoryProtocol) {
        self.playerRepository = playerRepository
        self.gameTypeRepository = gameTypeRepository
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
        GameListViewModel(gameTypeRepository: gameTypeRepository)
    }

    func onboardingFinished() async {
        await loadPhase()
    }
}
