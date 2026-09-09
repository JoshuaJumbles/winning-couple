//
//  GameListViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

struct GameListViewModelTests {
    @Test func loadGroupsGamesByCategory() async {
        let repository = InMemoryGameTypeRepository(gameTypes: [
            GameType(title: "Scrabble", category: .competitive, scoringStyle: .points),
            GameType(title: "Chess", category: .competitive, scoringStyle: .winLoss),
            GameType(title: "Pandemic", category: .cooperative, scoringStyle: .winLoss),
        ])
        let viewModel = GameListViewModel(gameTypeRepository: repository)

        await viewModel.load()

        #expect(viewModel.competitiveGames.map(\.title) == ["Scrabble", "Chess"])
        #expect(viewModel.cooperativeGames.map(\.title) == ["Pandemic"])
        #expect(!viewModel.hasNoGames)
    }

    @Test func hasNoGamesIsTrueWhenNothingHasBeenAddedYet() async {
        let viewModel = GameListViewModel(gameTypeRepository: InMemoryGameTypeRepository())

        await viewModel.load()

        #expect(viewModel.hasNoGames)
    }

    @Test func addingAGameReloadsTheList() async {
        let repository = InMemoryGameTypeRepository()
        let viewModel = GameListViewModel(gameTypeRepository: repository)
        await viewModel.load()
        #expect(viewModel.hasNoGames)

        let addViewModel = viewModel.makeAddGameTypeViewModel()
        addViewModel.title = "Scrabble"
        let succeeded = await addViewModel.save()

        #expect(succeeded)
        #expect(!viewModel.isPresentingAddGame)
        #expect(viewModel.competitiveGames.map(\.title) == ["Scrabble"])
    }
}
