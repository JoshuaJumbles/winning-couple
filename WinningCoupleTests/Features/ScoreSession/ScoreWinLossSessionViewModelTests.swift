//
//  ScoreWinLossSessionViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

struct ScoreWinLossSessionViewModelTests {
    private let jordan = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
    private let taylor = PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2])
    private let game = GameType(title: "Chess", category: .competitive, scoringStyle: .winLoss)

    @Test func cannotFinishBeforeAWinnerIsDeclared() async {
        let viewModel = ScoreWinLossSessionViewModel(
            gameType: game, playerOne: jordan, playerTwo: taylor,
            repository: InMemoryWinLossSessionRepository(), onFinished: {}
        )

        let succeeded = await viewModel.finish()

        #expect(!succeeded)
    }

    @Test func finishSavesTheWinnerAndTrimmedNotesThenCallsOnFinished() async {
        let repository = InMemoryWinLossSessionRepository()
        var onFinishedCallCount = 0
        let viewModel = ScoreWinLossSessionViewModel(
            gameType: game, playerOne: jordan, playerTwo: taylor,
            repository: repository
        ) { onFinishedCallCount += 1 }

        viewModel.declareWinner(taylor)
        viewModel.notes = "  Great comeback!  "

        let succeeded = await viewModel.finish()

        #expect(succeeded)
        #expect(onFinishedCallCount == 1)
        #expect(repository.sessions.count == 1)
        #expect(repository.sessions.first?.winnerPlayerID == taylor.id)
        #expect(repository.sessions.first?.notes == "Great comeback!")
        #expect(repository.sessions.first?.finishedDate != nil)
    }

    @Test func emptyNotesAreStoredAsNil() async {
        let repository = InMemoryWinLossSessionRepository()
        let viewModel = ScoreWinLossSessionViewModel(
            gameType: game, playerOne: jordan, playerTwo: taylor,
            repository: repository, onFinished: {}
        )
        viewModel.declareWinner(jordan)
        viewModel.notes = "   "

        await viewModel.finish()

        #expect(repository.sessions.first?.notes == nil)
    }

    @Test func finishSurfacesARepositoryFailure() async {
        let repository = InMemoryWinLossSessionRepository()
        repository.saveError = StubError()
        let viewModel = ScoreWinLossSessionViewModel(
            gameType: game, playerOne: jordan, playerTwo: taylor,
            repository: repository, onFinished: {}
        )
        viewModel.declareWinner(jordan)

        let succeeded = await viewModel.finish()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
        #expect(repository.sessions.isEmpty)
    }
}
