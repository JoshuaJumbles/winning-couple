//
//  EditPlayerViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

@MainActor
struct EditPlayerViewModelTests {
    @Test func seedsFieldsFromTheExistingPlayer() async {
        let player = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
        let viewModel = EditPlayerViewModel(player: player, playerRepository: InMemoryPlayerRepository(), onSaved: {})

        #expect(viewModel.name == "Jordan")
        #expect(viewModel.colorHex == PlayerColorPalette.swatches[0])
        #expect(viewModel.emoji == nil)
        #expect(viewModel.canSave)
    }

    @Test func seedsTheExistingEmoji() async {
        let player = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0], emoji: "🦊")
        let viewModel = EditPlayerViewModel(player: player, playerRepository: InMemoryPlayerRepository(), onSaved: {})

        #expect(viewModel.emoji == "🦊")
    }

    @Test func cannotSaveWithAnEmptyName() async {
        let player = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
        let viewModel = EditPlayerViewModel(player: player, playerRepository: InMemoryPlayerRepository(), onSaved: {})
        viewModel.name = "   "

        let succeeded = await viewModel.save()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
    }

    @Test func saveUpdatesThePlayerInPlaceAndCallsOnSaved() async {
        let player = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
        let repository = InMemoryPlayerRepository(players: [player])
        var onSavedCallCount = 0
        let viewModel = EditPlayerViewModel(player: player, playerRepository: repository) { onSavedCallCount += 1 }
        viewModel.name = "  Jordy  "
        viewModel.colorHex = PlayerColorPalette.swatches[3]
        viewModel.emoji = "🎲"

        let succeeded = await viewModel.save()

        #expect(succeeded)
        #expect(onSavedCallCount == 1)
        #expect(repository.players.count == 1) // updated in place, not duplicated
        #expect(repository.players.first?.name == "Jordy")
        #expect(repository.players.first?.colorHex == PlayerColorPalette.swatches[3])
        #expect(repository.players.first?.emoji == "🎲")
        #expect(player.name == "Jordy") // the original reference reflects the edit too
    }

    @Test func clearingTheEmojiSavesNil() async {
        let player = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0], emoji: "🦊")
        let repository = InMemoryPlayerRepository(players: [player])
        let viewModel = EditPlayerViewModel(player: player, playerRepository: repository, onSaved: {})
        viewModel.emoji = nil

        let succeeded = await viewModel.save()

        #expect(succeeded)
        #expect(player.emoji == nil)
    }

    @Test func saveSurfacesARepositoryFailure() async {
        let player = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
        let repository = InMemoryPlayerRepository(players: [player])
        repository.saveError = StubError()
        let viewModel = EditPlayerViewModel(player: player, playerRepository: repository, onSaved: {})

        let succeeded = await viewModel.save()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
    }
}
