//
//  SwiftDataScoringSessionRepository.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData

final class SwiftDataScoringSessionRepository: ScoringSessionRepositoryProtocol {
    private let modelContainer: ModelContainer

    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }

    @MainActor
    func fetchFinished(gameTypeID: UUID) async throws -> [ScoringSession] {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<ScoringSession>(
            predicate: #Predicate { $0.gameTypeID == gameTypeID && $0.finishedDate != nil },
            sortBy: [SortDescriptor(\.sessionDate)]
        )
        return try context.fetch(descriptor)
    }

    @MainActor
    func fetchTurns(sessionID: UUID) async throws -> [ScoreTurn] {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<ScoreTurn>(
            predicate: #Predicate { $0.sessionID == sessionID },
            sortBy: [SortDescriptor(\.turnIndex)]
        )
        return try context.fetch(descriptor)
    }

    @MainActor
    func save(_ session: ScoringSession) async throws {
        let context = modelContainer.mainContext
        context.insert(session)
        try context.save()
    }

    @MainActor
    func addTurn(_ turn: ScoreTurn) async throws {
        let context = modelContainer.mainContext
        context.insert(turn)
        try context.save()
    }

    @MainActor
    func deleteTurn(_ turn: ScoreTurn) async throws {
        let context = modelContainer.mainContext
        context.delete(turn)
        try context.save()
    }
}
