//
//  GameDetailViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import Testing
@testable import WinningCouple

struct GameDetailViewModelTests {
    private let jordan = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
    private let taylor = PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2])
    private let day1 = Date(timeIntervalSince1970: 1_000_000)
    private let day2 = Date(timeIntervalSince1970: 2_000_000)

    @Test func hasNoSessionsInitially() async {
        let viewModel = GameDetailViewModel(
            gameType: GameType(title: "Scrabble", category: .competitive, scoringStyle: .points),
            playerRepository: InMemoryPlayerRepository(players: [jordan, taylor]),
            scoringSessionRepository: InMemoryScoringSessionRepository(),
            winLossSessionRepository: InMemoryWinLossSessionRepository(),
            coopWinLossSessionRepository: InMemoryCoopWinLossSessionRepository()
        )

        #expect(viewModel.hasNoSessions)
    }

    @Test func pointsSessionsComputeWinnerAndRunningHistory() async {
        let game = GameType(title: "Scrabble", category: .competitive, scoringStyle: .points)
        let sessionA = ScoringSession(gameTypeID: game.id, sessionDate: day1, finishedDate: day1)
        let sessionB = ScoringSession(gameTypeID: game.id, sessionDate: day2, finishedDate: day2)
        let draftSession = ScoringSession(gameTypeID: game.id, sessionDate: day2) // unfinished, excluded

        let turns = [
            ScoreTurn(sessionID: sessionA.id, playerID: jordan.id, delta: 32, turnIndex: 0),
            ScoreTurn(sessionID: sessionA.id, playerID: jordan.id, delta: 45, turnIndex: 1),
            ScoreTurn(sessionID: sessionA.id, playerID: taylor.id, delta: 28, turnIndex: 2),
            ScoreTurn(sessionID: sessionB.id, playerID: taylor.id, delta: 90, turnIndex: 0),
            ScoreTurn(sessionID: sessionB.id, playerID: jordan.id, delta: 10, turnIndex: 1),
        ]

        let viewModel = GameDetailViewModel(
            gameType: game,
            playerRepository: InMemoryPlayerRepository(players: [jordan, taylor]),
            scoringSessionRepository: InMemoryScoringSessionRepository(sessions: [sessionA, sessionB, draftSession], turns: turns),
            winLossSessionRepository: InMemoryWinLossSessionRepository(),
            coopWinLossSessionRepository: InMemoryCoopWinLossSessionRepository()
        )

        await viewModel.load()

        #expect(!viewModel.hasNoSessions)
        #expect(viewModel.isCompetitive)
        #expect(viewModel.sessions.count == 2) // the draft session is excluded
        #expect(viewModel.sessions.map(\.resultText) == ["Taylor won \u{00B7} 90\u{2013}10", "Jordan won \u{00B7} 77\u{2013}28"]) // newest first
        #expect(viewModel.winHistory.map(\.playerOneWins) == [1, 1])
        #expect(viewModel.winHistory.map(\.playerTwoWins) == [0, 1])
    }

    @Test func winLossSessionsComputeWinnerAndRunningHistory() async {
        let game = GameType(title: "Chess", category: .competitive, scoringStyle: .winLoss)
        let sessionA = WinLossSession(gameTypeID: game.id, sessionDate: day1, finishedDate: day1, winnerPlayerID: jordan.id)
        let sessionB = WinLossSession(gameTypeID: game.id, sessionDate: day2, finishedDate: day2, winnerPlayerID: taylor.id)

        let viewModel = GameDetailViewModel(
            gameType: game,
            playerRepository: InMemoryPlayerRepository(players: [jordan, taylor]),
            scoringSessionRepository: InMemoryScoringSessionRepository(),
            winLossSessionRepository: InMemoryWinLossSessionRepository(sessions: [sessionA, sessionB]),
            coopWinLossSessionRepository: InMemoryCoopWinLossSessionRepository()
        )

        await viewModel.load()

        #expect(viewModel.sessions.map(\.resultText) == ["Taylor won", "Jordan won"]) // newest first
        #expect(viewModel.winHistory.map(\.playerOneWins) == [1, 1])
        #expect(viewModel.winHistory.map(\.playerTwoWins) == [0, 1])
    }

    @Test func coopSessionsComputeRecord() async {
        let game = GameType(title: "Pandemic", category: .cooperative, scoringStyle: .winLoss)
        let won = CoopWinLossSession(gameTypeID: game.id, sessionDate: day1, finishedDate: day1, didWin: true)
        let lost = CoopWinLossSession(gameTypeID: game.id, sessionDate: day2, finishedDate: day2, didWin: false)

        let viewModel = GameDetailViewModel(
            gameType: game,
            playerRepository: InMemoryPlayerRepository(players: [jordan, taylor]),
            scoringSessionRepository: InMemoryScoringSessionRepository(),
            winLossSessionRepository: InMemoryWinLossSessionRepository(),
            coopWinLossSessionRepository: InMemoryCoopWinLossSessionRepository(sessions: [won, lost])
        )

        await viewModel.load()

        #expect(!viewModel.isCompetitive)
        #expect(viewModel.coopRecord?.wins == 1)
        #expect(viewModel.coopRecord?.losses == 1)
        #expect(viewModel.sessions.map(\.resultText) == ["You lost \u{00B7} as a team", "You won \u{00B7} as a team"]) // newest first
    }

    @Test func notesAndPhotosAreFlaggedOnTheSummary() async {
        let game = GameType(title: "Chess", category: .competitive, scoringStyle: .winLoss)
        let session = WinLossSession(
            gameTypeID: game.id,
            sessionDate: day1,
            finishedDate: day1,
            winnerPlayerID: jordan.id,
            notes: "Close game!",
            photoData: Data([0x01])
        )

        let viewModel = GameDetailViewModel(
            gameType: game,
            playerRepository: InMemoryPlayerRepository(players: [jordan, taylor]),
            scoringSessionRepository: InMemoryScoringSessionRepository(),
            winLossSessionRepository: InMemoryWinLossSessionRepository(sessions: [session]),
            coopWinLossSessionRepository: InMemoryCoopWinLossSessionRepository()
        )

        await viewModel.load()

        #expect(viewModel.sessions.first?.hasNote == true)
        #expect(viewModel.sessions.first?.hasPhoto == true)
    }
}
