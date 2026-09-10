//
//  AddGameTypeViewModelTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Testing
@testable import WinningCouple

struct AddGameTypeViewModelTests {
    @Test func cannotSaveWithoutATitle() async {
        let viewModel = AddGameTypeViewModel(gameTypeRepository: InMemoryGameTypeRepository(), onSaved: {})
        #expect(!viewModel.canSave)

        viewModel.title = "   "
        #expect(!viewModel.canSave)

        viewModel.title = "Scrabble"
        #expect(viewModel.canSave)
    }

    @Test func choosingCooperativeLocksScoringToWinLoss() async {
        let viewModel = AddGameTypeViewModel(gameTypeRepository: InMemoryGameTypeRepository(), onSaved: {})
        viewModel.scoringStyle = .points
        #expect(!viewModel.isScoringStyleLocked)

        viewModel.category = .cooperative

        #expect(viewModel.isScoringStyleLocked)
        #expect(viewModel.scoringStyle == .winLoss)
    }

    @Test func savePersistsTheGameAndCallsOnSaved() async {
        let repository = InMemoryGameTypeRepository()
        var onSavedCallCount = 0
        let viewModel = AddGameTypeViewModel(gameTypeRepository: repository) {
            onSavedCallCount += 1
        }
        viewModel.title = "  Scrabble  "
        viewModel.category = .competitive
        viewModel.scoringStyle = .points

        let succeeded = await viewModel.save()

        #expect(succeeded)
        #expect(onSavedCallCount == 1)
        #expect(repository.gameTypes.count == 1)
        #expect(repository.gameTypes.first?.title == "Scrabble") // trimmed
    }

    @Test func saveSurfacesARepositoryFailure() async {
        let repository = InMemoryGameTypeRepository()
        repository.saveError = StubError()
        let viewModel = AddGameTypeViewModel(gameTypeRepository: repository, onSaved: {})
        viewModel.title = "Scrabble"

        let succeeded = await viewModel.save()

        #expect(!succeeded)
        #expect(viewModel.errorMessage != nil)
        #expect(repository.gameTypes.isEmpty)
    }
}
