//
//  AddGameTypeViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class AddGameTypeViewModel {
    var title: String = ""
    var thumbnailData: Data?
    var errorMessage: String?
    private(set) var isSaving = false

    var category: GameCategory = .competitive {
        didSet {
            // Cooperative + points has no session model yet (see the
            // data-layer PR's known-gap note), so steer cooperative
            // games to win/loss until that's resolved.
            if category == .cooperative {
                scoringStyle = .winLoss
            }
        }
    }
    var scoringStyle: ScoringStyle = .points

    private let gameTypeRepository: GameTypeRepositoryProtocol
    private let onSaved: () async -> Void

    init(gameTypeRepository: GameTypeRepositoryProtocol, onSaved: @escaping () async -> Void) {
        self.gameTypeRepository = gameTypeRepository
        self.onSaved = onSaved
    }

    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var canSave: Bool {
        !trimmedTitle.isEmpty
    }

    /// Cooperative games can't pick a scoring style right now — always win/loss.
    var isScoringStyleLocked: Bool {
        category == .cooperative
    }

    @discardableResult
    func save() async -> Bool {
        guard canSave else {
            errorMessage = "Give the game a title."
            return false
        }

        isSaving = true
        defer { isSaving = false }

        do {
            try await gameTypeRepository.save(
                GameType(title: trimmedTitle, category: category, scoringStyle: scoringStyle, thumbnailData: thumbnailData)
            )
            await onSaved()
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
