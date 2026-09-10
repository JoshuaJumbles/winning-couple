//
//  ScoreWinLossSessionViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class ScoreWinLossSessionViewModel {
    let gameType: GameType
    let playerOne: PlayerProfile
    let playerTwo: PlayerProfile

    private(set) var declaredWinner: PlayerProfile?
    var notes: String = ""
    var photoData: Data?
    var errorMessage: String?
    private(set) var isSaving = false

    private let repository: WinLossSessionRepositoryProtocol
    private let onFinished: () async -> Void

    init(
        gameType: GameType,
        playerOne: PlayerProfile,
        playerTwo: PlayerProfile,
        repository: WinLossSessionRepositoryProtocol,
        onFinished: @escaping () async -> Void
    ) {
        self.gameType = gameType
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.repository = repository
        self.onFinished = onFinished
    }

    func declareWinner(_ player: PlayerProfile) {
        declaredWinner = player
    }

    @discardableResult
    func finish() async -> Bool {
        guard let declaredWinner else { return false }

        isSaving = true
        defer { isSaving = false }

        let trimmedNotes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
        let session = WinLossSession(
            gameTypeID: gameType.id,
            finishedDate: .now,
            winnerPlayerID: declaredWinner.id,
            notes: trimmedNotes.isEmpty ? nil : trimmedNotes,
            photoData: photoData
        )

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
