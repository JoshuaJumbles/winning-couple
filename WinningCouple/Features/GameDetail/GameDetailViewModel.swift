//
//  GameDetailViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class GameDetailViewModel {
    let gameType: GameType

    private(set) var sessions: [GameSessionSummary] = []
    private(set) var winHistory: [WinHistoryPoint] = []
    private(set) var coopRecord: CoopRecord?
    private(set) var playerOne: PlayerProfile?
    private(set) var playerTwo: PlayerProfile?
    var errorMessage: String?

    private let playerRepository: PlayerRepositoryProtocol
    private let scoringSessionRepository: ScoringSessionRepositoryProtocol
    private let winLossSessionRepository: WinLossSessionRepositoryProtocol
    private let coopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol

    init(
        gameType: GameType,
        playerRepository: PlayerRepositoryProtocol,
        scoringSessionRepository: ScoringSessionRepositoryProtocol,
        winLossSessionRepository: WinLossSessionRepositoryProtocol,
        coopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol
    ) {
        self.gameType = gameType
        self.playerRepository = playerRepository
        self.scoringSessionRepository = scoringSessionRepository
        self.winLossSessionRepository = winLossSessionRepository
        self.coopWinLossSessionRepository = coopWinLossSessionRepository
    }

    var hasNoSessions: Bool {
        sessions.isEmpty
    }

    /// Competitive games show a win-history graph; cooperative games
    /// show a simple record instead (see the known gap on GameType —
    /// there's no cooperative points variant to graph either way).
    var isCompetitive: Bool {
        gameType.category == .competitive
    }

    func load() async {
        do {
            let players = try await playerRepository.fetchAll()
            playerOne = players.first
            playerTwo = players.dropFirst().first

            switch gameType.category {
            case .competitive:
                switch gameType.scoringStyle {
                case .points:
                    try await loadPointsSessions()
                case .winLoss:
                    try await loadWinLossSessions()
                }
            case .cooperative:
                try await loadCoopSessions()
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    private func loadPointsSessions() async throws {
        let playerOneID = playerOne?.id
        let playerTwoID = playerTwo?.id
        let scoringSessions = try await scoringSessionRepository.fetchFinished(gameTypeID: gameType.id)

        var summaries: [GameSessionSummary] = []
        var history: [WinHistoryPoint] = []
        var playerOneWins = 0
        var playerTwoWins = 0

        for (index, session) in scoringSessions.enumerated() {
            let turns = try await scoringSessionRepository.fetchTurns(sessionID: session.id)
            let playerOneTotal = turns.filter { $0.playerID == playerOneID }.reduce(0) { $0 + $1.delta }
            let playerTwoTotal = turns.filter { $0.playerID == playerTwoID }.reduce(0) { $0 + $1.delta }

            let resultText: String
            if playerOneTotal > playerTwoTotal {
                playerOneWins += 1
                resultText = "\(playerOne?.name ?? "Player one") won \u{00B7} \(playerOneTotal)\u{2013}\(playerTwoTotal)"
            } else if playerTwoTotal > playerOneTotal {
                playerTwoWins += 1
                resultText = "\(playerTwo?.name ?? "Player two") won \u{00B7} \(playerTwoTotal)\u{2013}\(playerOneTotal)"
            } else {
                resultText = "Tied \u{00B7} \(playerOneTotal)\u{2013}\(playerTwoTotal)"
            }

            summaries.append(makeSummary(id: session.id, date: session.sessionDate, resultText: resultText, notes: session.notes, photoData: session.photoData))
            history.append(WinHistoryPoint(id: session.id, sessionIndex: index, playerOneWins: playerOneWins, playerTwoWins: playerTwoWins))
        }

        sessions = summaries.sorted { $0.date > $1.date }
        winHistory = history
    }

    private func loadWinLossSessions() async throws {
        let winLossSessions = try await winLossSessionRepository.fetchFinished(gameTypeID: gameType.id)

        var summaries: [GameSessionSummary] = []
        var history: [WinHistoryPoint] = []
        var playerOneWins = 0
        var playerTwoWins = 0

        for (index, session) in winLossSessions.enumerated() {
            let winnerName: String
            if session.winnerPlayerID == playerOne?.id {
                playerOneWins += 1
                winnerName = playerOne?.name ?? "Player one"
            } else if session.winnerPlayerID == playerTwo?.id {
                playerTwoWins += 1
                winnerName = playerTwo?.name ?? "Player two"
            } else {
                winnerName = "Someone"
            }

            summaries.append(makeSummary(id: session.id, date: session.sessionDate, resultText: "\(winnerName) won", notes: session.notes, photoData: session.photoData))
            history.append(WinHistoryPoint(id: session.id, sessionIndex: index, playerOneWins: playerOneWins, playerTwoWins: playerTwoWins))
        }

        sessions = summaries.sorted { $0.date > $1.date }
        winHistory = history
    }

    private func loadCoopSessions() async throws {
        let coopSessions = try await coopWinLossSessionRepository.fetchFinished(gameTypeID: gameType.id)

        var summaries: [GameSessionSummary] = []
        var wins = 0
        var losses = 0

        for session in coopSessions {
            if session.didWin {
                wins += 1
            } else {
                losses += 1
            }
            let resultText = session.didWin ? "You won \u{00B7} as a team" : "You lost \u{00B7} as a team"
            summaries.append(makeSummary(id: session.id, date: session.sessionDate, resultText: resultText, notes: session.notes, photoData: session.photoData))
        }

        sessions = summaries.sorted { $0.date > $1.date }
        coopRecord = coopSessions.isEmpty ? nil : CoopRecord(wins: wins, losses: losses)
    }

    private func makeSummary(id: UUID, date: Date, resultText: String, notes: String?, photoData: Data?) -> GameSessionSummary {
        GameSessionSummary(
            id: id,
            date: date,
            resultText: resultText,
            hasNote: notes?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false,
            hasPhoto: photoData != nil
        )
    }
}
