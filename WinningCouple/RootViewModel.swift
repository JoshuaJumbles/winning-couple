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
        case home([PlayerProfile])
    }

    private(set) var phase: Phase = .loading
    private let playerRepository: PlayerRepositoryProtocol

    init(playerRepository: PlayerRepositoryProtocol) {
        self.playerRepository = playerRepository
    }

    /// Two players configured during onboarding means onboarding is
    /// done; anything less and we send the player back through it.
    func loadPhase() async {
        let players = (try? await playerRepository.fetchAll()) ?? []
        phase = players.count >= 2 ? .home(players) : .onboarding
    }

    func makeOnboardingViewModel() -> OnboardingViewModel {
        OnboardingViewModel(playerRepository: playerRepository)
    }

    func onboardingFinished() async {
        await loadPhase()
    }
}
