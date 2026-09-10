//
//  SwiftDataCoopWinLossSessionRepository.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

final class SwiftDataCoopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol {
    private let modelContainer: ModelContainer

    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    @MainActor
    func fetchFinished(gameTypeID: UUID) async throws -> [CoopWinLossSession] {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<CoopWinLossSession>(
            predicate: #Predicate { $0.gameTypeID == gameTypeID && $0.finishedDate != nil },
            sortBy: [SortDescriptor(\.sessionDate)]
        )
        return try context.fetch(descriptor)
    }

    @MainActor
    func save(_ session: CoopWinLossSession) async throws {
        let context = modelContainer.mainContext
        context.insert(session)
        try context.save()
    }
}
