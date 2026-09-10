//
//  SwiftDataGameTypeRepository.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

final class SwiftDataGameTypeRepository: GameTypeRepositoryProtocol {
    private let modelContainer: ModelContainer

    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    @MainActor
    func fetchAll() async throws -> [GameType] {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<GameType>(sortBy: [SortDescriptor(\.createdAt)])
        return try context.fetch(descriptor)
    }

    @MainActor
    func save(_ gameType: GameType) async throws {
        let context = modelContainer.mainContext
        context.insert(gameType)
        try context.save()
    }
}
