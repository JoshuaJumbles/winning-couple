//
//  ScoreCoopSessionViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class ScoreCoopSessionViewModel {
    let gameType: GameType

    private(set) var declaredOutcome: Bool?
    var notes: String = ""
    var photoData: Data?
    var errorMessage: String?
    private(set) var isSaving = false

    private let repository: CoopWinLossSessionRepositoryProtocol
    private let onFinished: () async -> Void

    init(gameType: GameType, repository: CoopWinLossSessionRepositoryProtocol, onFinished: @escaping () async -> Void) {
        self.gameType = gameType
        self.repository = repository
        self.onFinished = onFinished
    }

    func declareOutcome(didWin: Bool) {
        declaredOutcome = didWin
    }

    @discardableResult
    func finish() async -> Bool {
        guard let declaredOutcome else { return false }

        isSaving = true
        defer { isSaving = false }

        let trimmedNotes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
        let session = CoopWinLossSession(
            gameTypeID: gameType.id,
            finishedDate: .now,
            didWin: declaredOutcome,
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
