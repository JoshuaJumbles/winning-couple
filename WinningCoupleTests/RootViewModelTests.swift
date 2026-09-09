//
//  RootViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

struct RootViewModelTests {
    @Test func sendsAFreshCoupleToOnboarding() async {
        let repository = InMemoryPlayerRepository()
        let viewModel = RootViewModel(playerRepository: repository)

        await viewModel.loadPhase()

        guard case .onboarding = viewModel.phase else {
            Issue.record("expected .onboarding, got \(viewModel.phase)")
            return
        }
    }

    @Test func sendsAnAlreadyOnboardedCoupleHome() async {
        let repository = InMemoryPlayerRepository(players: [
            PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
            PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
        ])
        let viewModel = RootViewModel(playerRepository: repository)

        await viewModel.loadPhase()

        guard case .home(let players) = viewModel.phase else {
            Issue.record("expected .home, got \(viewModel.phase)")
            return
        }
        #expect(players.count == 2)
    }

    @Test func onboardingFinishedReEvaluatesThePhase() async {
        let repository = InMemoryPlayerRepository()
        let viewModel = RootViewModel(playerRepository: repository)
        await viewModel.loadPhase()

        try? await repository.save(PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]))
        try? await repository.save(PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]))
        await viewModel.onboardingFinished()

        guard case .home = viewModel.phase else {
            Issue.record("expected .home after onboarding finished, got \(viewModel.phase)")
            return
        }
    }
}
