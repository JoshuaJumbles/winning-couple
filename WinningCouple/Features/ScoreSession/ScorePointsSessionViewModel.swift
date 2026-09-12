//
//  ScorePointsSessionViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

/// One point in the running "this session" score history — every
/// player's total right after a given turn.
struct SessionScorePoint: Identifiable {
    let id: UUID
    let turnNumber: Int
    let playerOneTotal: Int
    let playerTwoTotal: Int
}

@Observable
final class ScorePointsSessionViewModel {
    let gameType: GameType
    let playerOne: PlayerProfile
    let playerTwo: PlayerProfile

    private(set) var turns: [ScoreTurn] = []
    private(set) var isCelebrating = false
    var notes: String = ""
    var photoData: Data?
    var errorMessage: String?
    private(set) var isSaving = false

    private let session: ScoringSession
    private let repository: ScoringSessionRepositoryProtocol
    private let onFinished: () async -> Void

    init(
        gameType: GameType,
        playerOne: PlayerProfile,
        playerTwo: PlayerProfile,
        repository: ScoringSessionRepositoryProtocol,
        onFinished: @escaping () async -> Void
    ) {
        self.gameType = gameType
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.repository = repository
        self.onFinished = onFinished
        self.session = ScoringSession(gameTypeID: gameType.id)
    }

    // MARK: Live turn log

    /// Persists the (unfinished) session so it — and every turn added
    /// from here on — exists in the store immediately, not just once
    /// the whole thing is finished.
    func start() async {
        do {
            try await repository.save(session)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func addTurn(for player: PlayerProfile, delta: Int) async {
        let turn = ScoreTurn(sessionID: session.id, playerID: player.id, delta: delta, turnIndex: turns.count)
        do {
            try await repository.addTurn(turn)
            turns.append(turn)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteTurns(for player: PlayerProfile, at offsets: IndexSet) async {
        let playerTurns = turns
            .filter { $0.playerID == player.id }
            .sorted { $0.turnIndex < $1.turnIndex }
        let toDelete = offsets.map { playerTurns[$0] }
        for turn in toDelete {
            do {
                try await repository.deleteTurn(turn)
                turns.removeAll { $0.id == turn.id }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }

    func turns(for player: PlayerProfile) -> [ScoreTurn] {
        turns
            .filter { $0.playerID == player.id }
            .sorted { $0.turnIndex < $1.turnIndex }
    }

    func total(for player: PlayerProfile) -> Int {
        turns.filter { $0.playerID == player.id }.reduce(0) { $0 + $1.delta }
    }

    /// A single data point can't draw a line — Swift Charts needs at
    /// least two to render a segment. So once there's been at least one
    /// turn, this leads with a synthetic 0/0 point at turnNumber 0 (real
    /// turns shift to 1, 2, ...) purely for the chart to have somewhere
    /// to draw *from*. That baseline is presentation-only: nothing is
    /// persisted for it, and its `id` is a fixed constant (not derived
    /// per-call) so the chart doesn't see it as a "new" point on every
    /// access of this computed property.
    private static let baselinePointID = UUID()

    var scoreHistory: [SessionScorePoint] {
        let sortedTurns = turns.sorted { $0.turnIndex < $1.turnIndex }
        guard !sortedTurns.isEmpty else { return [] }

        var playerOneTotal = 0
        var playerTwoTotal = 0
        var points = [SessionScorePoint(id: Self.baselinePointID, turnNumber: 0, playerOneTotal: 0, playerTwoTotal: 0)]
        for (index, turn) in sortedTurns.enumerated() {
            if turn.playerID == playerOne.id {
                playerOneTotal += turn.delta
            } else {
                playerTwoTotal += turn.delta
            }
            points.append(SessionScorePoint(id: turn.id, turnNumber: index + 1, playerOneTotal: playerOneTotal, playerTwoTotal: playerTwoTotal))
        }
        return points
    }

    /// `nil` means a tie — no single winner to celebrate.
    var winner: PlayerProfile? {
        let playerOneTotal = total(for: playerOne)
        let playerTwoTotal = total(for: playerTwo)
        if playerOneTotal > playerTwoTotal { return playerOne }
        if playerTwoTotal > playerOneTotal { return playerTwo }
        return nil
    }

    // MARK: Wrapping up

    func requestFinish() {
        isCelebrating = true
    }

    @discardableResult
    func finish() async -> Bool {
        isSaving = true
        defer { isSaving = false }

        session.finishedDate = .now
        let trimmedNotes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
        session.notes = trimmedNotes.isEmpty ? nil : trimmedNotes
        session.photoData = photoData

        do {
            try await repository.save(session)
            await onFinished()
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
