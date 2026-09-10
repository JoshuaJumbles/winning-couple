//
//  ScoreCoopSessionViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

@MainActor
struct ScoreCoopSessionViewModelTests {
    private let game = GameType(title: "Pandemic", category: .cooperative, scoringStyle: .winLoss)

    @Test func cannotFinishBeforeAnOutcomeIsDeclared() async {
        let viewModel = ScoreCoopSessionViewModel(gameType: game, repository: InMemoryCoopWinLossSessionRepository(), onFinished: {})

        let succeeded = await viewModel.finish()

        #expect(!succeeded)
    }

    @Test func finishSavesTheOutcomeThenCallsOnFinished() async {
        let repository = InMemoryCoopWinLossSessionRepository()
        var onFinishedCallCount = 0
        let viewModel = ScoreCoopSessionViewModel(gameType: game, repository: repository) { onFinishedCallCount += 1 }

        viewModel.declareOutcome(didWin: true)
        let succeeded = await viewModel.finish()

        #expect(succeeded)
        #expect(onFinishedCallCount == 1)
        #expect(repository.sessions.first?.didWin == true)
        #expect(repository.sessions.first?.finishedDate != nil)
    }

    @Test func finishSurfacesARepositoryFailure() async {
        let repository = InMemoryCoopWinLossSessionRepository()
        repository.saveError = StubError()
        let viewModel = ScoreCoopSessionViewModel(gameType: game, repository: repository, onFinished: {})
        viewModel.declareOutcome(didWin: false)

        let succeeded = await viewModel.finish()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
        #expect(repository.sessions.isEmpty)
    }
}
