//
//  SettingsViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

@MainActor
struct SettingsViewModelTests {
    @Test func loadFetchesBothPlayers() async {
        let repository = InMemoryPlayerRepository(players: [
            PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
            PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
        ])
        let viewModel = SettingsViewModel(playerRepository: repository)

        await viewModel.load()

        #expect(viewModel.players.map(\.name) == ["Jordan", "Taylor"])
    }

    @Test func makeEditPlayerViewModelSeedsFromTheSelectedPlayer() async {
        let repository = InMemoryPlayerRepository()
        let viewModel = SettingsViewModel(playerRepository: repository)
        let jordan = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])

        let editViewModel = viewModel.makeEditPlayerViewModel(for: jordan)

        #expect(editViewModel.name == "Jordan")
        #expect(editViewModel.colorHex == PlayerColorPalette.swatches[0])
    }

    @Test func editingAPlayerReloadsTheList() async {
        let jordan = PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0])
        let repository = InMemoryPlayerRepository(players: [jordan])
        let viewModel = SettingsViewModel(playerRepository: repository)
        await viewModel.load()

        let editViewModel = viewModel.makeEditPlayerViewModel(for: jordan)
        editViewModel.name = "Jordy"
        await editViewModel.save()

        #expect(viewModel.players.first?.name == "Jordy")
    }
}
