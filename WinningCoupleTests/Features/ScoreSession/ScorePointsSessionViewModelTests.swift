//
//  ScorePointsSessionViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import Testing
@testable import WinningCouple

@MainActor
struct ScorePointsSessionViewModelTests {
    private let jordan = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
    private let taylor = PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2])
    private let game = GameType(title: "Scrabble", category: .competitive, scoringStyle: .points)

    private func makeViewModel(repository: InMemoryScoringSessionRepository, onFinished: @escaping () async -> Void = {}) -> ScorePointsSessionViewModel {
        ScorePointsSessionViewModel(gameType: game, playerOne: jordan, playerTwo: taylor, repository: repository, onFinished: onFinished)
    }

    @Test func startPersistsAnUnfinishedSession() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)

        await viewModel.start()

        #expect(repository.sessions.count == 1)
        #expect(repository.sessions.first?.finishedDate == nil)
    }

    @Test func addingTurnsTracksRunningTotalsAndHistory() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)
        await viewModel.start()

        await viewModel.addTurn(for: jordan, delta: 32)
        await viewModel.addTurn(for: taylor, delta: 18)
        await viewModel.addTurn(for: jordan, delta: 45)

        #expect(viewModel.total(for: jordan) == 77)
        #expect(viewModel.total(for: taylor) == 18)
        #expect(repository.turns.count == 3)

        let history = viewModel.scoreHistory
        // Leads with a synthetic 0/0 point so the chart has somewhere to
        // draw its first line segment *from* — see scoreHistory's doc comment.
        #expect(history.map(\.playerOneTotal) == [0, 32, 32, 77])
        #expect(history.map(\.playerTwoTotal) == [0, 0, 18, 18])
        #expect(history.map(\.turnNumber) == [0, 1, 2, 3])
    }

    @Test func scoreHistoryIsEmptyBeforeAnyTurns() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)
        await viewModel.start()

        #expect(viewModel.scoreHistory.isEmpty)
    }

    @Test func deletingATurnRemovesItFromTheLogAndTheTotal() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)
        await viewModel.start()
        await viewModel.addTurn(for: jordan, delta: 32)
        await viewModel.addTurn(for: jordan, delta: 45)

        await viewModel.deleteTurns(for: jordan, at: IndexSet(integer: 0)) // the +32 turn

        #expect(viewModel.turns(for: jordan).map(\.delta) == [45])
        #expect(viewModel.total(for: jordan) == 45)
        #expect(repository.turns.count == 1)
    }

    @Test func winnerIsWhoeverHasTheHigherTotal() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)
        await viewModel.start()
        await viewModel.addTurn(for: jordan, delta: 50)
        await viewModel.addTurn(for: taylor, delta: 30)

        #expect(viewModel.winner?.id == jordan.id)
    }

    @Test func aTieHasNoWinner() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)
        await viewModel.start()
        await viewModel.addTurn(for: jordan, delta: 40)
        await viewModel.addTurn(for: taylor, delta: 40)

        #expect(viewModel.winner == nil)
    }

    @Test func finishSetsFinishedDateNotesAndPhotoThenCallsOnFinished() async {
        let repository = InMemoryScoringSessionRepository()
        var onFinishedCallCount = 0
        let viewModel = makeViewModel(repository: repository) { onFinishedCallCount += 1 }
        await viewModel.start()
        await viewModel.addTurn(for: jordan, delta: 50)
        viewModel.requestFinish()
        viewModel.notes = "  Great game  "

        let succeeded = await viewModel.finish()

        #expect(succeeded)
        #expect(viewModel.isCelebrating)
        #expect(onFinishedCallCount == 1)
        #expect(repository.sessions.count == 1)
        #expect(repository.sessions.first?.finishedDate != nil)
        #expect(repository.sessions.first?.notes == "Great game")
    }

    @Test func finishSurfacesARepositoryFailure() async {
        let repository = InMemoryScoringSessionRepository()
        let viewModel = makeViewModel(repository: repository)
        await viewModel.start() // succeeds — session exists before the failure we're testing

        repository.saveError = StubError()
        let succeeded = await viewModel.finish()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
    }
}
