//
//  OnboardingViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

/// The in-progress name/color/photo for one of the two players on the
/// onboarding form. Not persisted until `OnboardingViewModel.finish()`
/// succeeds.
@Observable
final class DraftPlayer {
    var name: String = ""
    var colorHex: String
    var photoData: Data?

    init(colorHex: String) {
        self.colorHex = colorHex
    }

    var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

@Observable
final class OnboardingViewModel {
    let playerOne = DraftPlayer(colorHex: PlayerColorPalette.swatches[0])
    let playerTwo = DraftPlayer(colorHex: PlayerColorPalette.swatches[2])
    var errorMessage: String?
    private(set) var isSaving = false

    private let playerRepository: PlayerRepositoryProtocol

    init(playerRepository: PlayerRepositoryProtocol) {
        self.playerRepository = playerRepository
    }

    var canFinish: Bool {
        !playerOne.trimmedName.isEmpty && !playerTwo.trimmedName.isEmpty
    }

    /// Saves both players. Returns `true` on success so the caller can
    /// move past onboarding; `false` leaves `errorMessage` set and the
    /// form as-is so the player can retry.
    @discardableResult
    func finish() async -> Bool {
        guard canFinish else {
            errorMessage = "Enter a name for both players."
            return false
        }

        isSaving = true
        defer { isSaving = false }

        do {
            try await playerRepository.save(
                PlayerProfile(name: playerOne.trimmedName, colorHex: playerOne.colorHex, photoData: playerOne.photoData)
            )
            try await playerRepository.save(
                PlayerProfile(name: playerTwo.trimmedName, colorHex: playerTwo.colorHex, photoData: playerTwo.photoData)
            )
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
