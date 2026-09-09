//
//  OnboardingViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

struct OnboardingViewModelTests {
    @Test func cannotFinishUntilBothNamesAreEntered() async {
        let repository = InMemoryPlayerRepository()
        let viewModel = OnboardingViewModel(playerRepository: repository)
        #expect(!viewModel.canFinish)

        viewModel.playerOne.name = "Jordan"
        #expect(!viewModel.canFinish)

        viewModel.playerTwo.name = "  " // whitespace-only shouldn't count
        #expect(!viewModel.canFinish)

        viewModel.playerTwo.name = "Taylor"
        #expect(viewModel.canFinish)
    }

    @Test func finishSavesBothPlayersWithTheirChosenColor() async {
        let repository = InMemoryPlayerRepository()
        let viewModel = OnboardingViewModel(playerRepository: repository)
        viewModel.playerOne.name = "Jordan"
        viewModel.playerOne.colorHex = PlayerColorPalette.swatches[0]
        viewModel.playerTwo.name = "Taylor"
        viewModel.playerTwo.colorHex = PlayerColorPalette.swatches[2]

        let succeeded = await viewModel.finish()

        #expect(succeeded)
        #expect(repository.players.count == 2)
        #expect(repository.players[0].name == "Jordan")
        #expect(repository.players[0].colorHex == PlayerColorPalette.swatches[0])
        #expect(repository.players[1].name == "Taylor")
        #expect(repository.players[1].colorHex == PlayerColorPalette.swatches[2])
    }

    @Test func finishSurfacesARepositoryFailureWithoutCrashing() async {
        let repository = InMemoryPlayerRepository()
        repository.saveError = StubError()
        let viewModel = OnboardingViewModel(playerRepository: repository)
        viewModel.playerOne.name = "Jordan"
        viewModel.playerTwo.name = "Taylor"

        let succeeded = await viewModel.finish()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
        #expect(repository.players.isEmpty)
    }
}
