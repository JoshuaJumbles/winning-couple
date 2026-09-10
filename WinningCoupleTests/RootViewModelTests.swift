//
//  RootViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

struct RootViewModelTests {
    private func makeViewModel(playerRepository: InMemoryPlayerRepository) -> RootViewModel {
        RootViewModel(
            playerRepository: playerRepository,
            gameTypeRepository: InMemoryGameTypeRepository(),
            scoringSessionRepository: InMemoryScoringSessionRepository(),
            winLossSessionRepository: InMemoryWinLossSessionRepository(),
            coopWinLossSessionRepository: InMemoryCoopWinLossSessionRepository()
        )
    }

    @Test func sendsAFreshCoupleToOnboarding() async {
        let viewModel = makeViewModel(playerRepository: InMemoryPlayerRepository())

        await viewModel.loadPhase()

        guard case .onboarding = viewModel.phase else {
            Issue.record("expected .onboarding, got \(viewModel.phase)")
            return
        }
    }

    @Test func sendsAnAlreadyOnboardedCoupleHome() async {
        let playerRepository = InMemoryPlayerRepository(players: [
            PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
            PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
        ])
        let viewModel = makeViewModel(playerRepository: playerRepository)

        await viewModel.loadPhase()

        guard case .home = viewModel.phase else {
            Issue.record("expected .home, got \(viewModel.phase)")
            return
        }
    }

    @Test func onboardingFinishedReEvaluatesThePhase() async {
        let playerRepository = InMemoryPlayerRepository()
        let viewModel = makeViewModel(playerRepository: playerRepository)
        await viewModel.loadPhase()

        try? await playerRepository.save(PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]))
        try? await playerRepository.save(PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]))
        await viewModel.onboardingFinished()

        guard case .home = viewModel.phase else {
            Issue.record("expected .home after onboarding finished, got \(viewModel.phase)")
            return
        }
    }
}
