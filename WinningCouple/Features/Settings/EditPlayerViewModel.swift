//
//  EditPlayerViewModel.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

@Observable
final class EditPlayerViewModel {
    let player: PlayerProfile
    var name: String
    var colorHex: String
    var photoData: Data?
    var errorMessage: String?
    private(set) var isSaving = false

    private let playerRepository: PlayerRepositoryProtocol
    private let onSaved: () async -> Void

    init(player: PlayerProfile, playerRepository: PlayerRepositoryProtocol, onSaved: @escaping () async -> Void) {
        self.player = player
        self.name = player.name
        self.colorHex = player.colorHex
        self.photoData = player.photoData
        self.playerRepository = playerRepository
        self.onSaved = onSaved
    }

    var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var canSave: Bool {
        !trimmedName.isEmpty
    }

    @discardableResult
    func save() async -> Bool {
        guard canSave else {
            errorMessage = "Give this player a name."
            return false
        }

        isSaving = true
        defer { isSaving = false }

        player.name = trimmedName
        player.colorHex = colorHex
        player.photoData = photoData

        do {
            try await playerRepository.save(player)
            await onSaved()
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
