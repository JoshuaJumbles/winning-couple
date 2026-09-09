//
//  SwiftDataPlayerRepository.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

final class SwiftDataPlayerRepository: PlayerRepositoryProtocol {
    private let modelContainer: ModelContainer

    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    @MainActor
    func fetchAll() async throws -> [PlayerProfile] {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<PlayerProfile>(sortBy: [SortDescriptor(\.createdAt)])
        return try context.fetch(descriptor)
    }

    @MainActor
    func save(_ player: PlayerProfile) async throws {
        let context = modelContainer.mainContext
        context.insert(player)
        try context.save()
    }
}
