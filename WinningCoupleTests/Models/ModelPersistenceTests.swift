//
//  ModelPersistenceTests.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation
import SwiftData
import Testing
@testable import WinningCouple

/// Round-trips each model type through an in-memory `ModelContainer`
/// to confirm the schema is well-formed and fields survive a save/fetch.
struct ModelPersistenceTests {
    private func makeInMemoryContext() throws -> ModelContext {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Schema(WinningCoupleSchema.models), configurations: configuration)
        return ModelContext(container)
    }

    @Test func playerProfileRoundTrips() throws {
        let context = try makeInMemoryContext()
        let player = PlayerProfile(name: "Jordan", colorHex: "#FF6F61")
        context.insert(player)
        try context.save()

        let fetched = try context.fetch(FetchDescriptor<PlayerProfile>())
        #expect(fetched.count == 1)
        #expect(fetched.first?.name == "Jordan")
        #expect(fetched.first?.colorHex == "#FF6F61")
    }

    @Test func gameTypeRoundTrips() throws {
        let context = try makeInMemoryContext()
        let game = GameType(title: "Scrabble", category: .competitive, scoringStyle: .points)
        context.insert(game)
        try context.save()

        let fetched = try context.fetch(FetchDescriptor<GameType>())
        #expect(fetched.first?.title == "Scrabble")
        #expect(fetched.first?.category == .competitive)
        #expect(fetched.first?.scoringStyle == .points)
    }

    @Test func scoringSessionAndTurnsRoundTrip() throws {
        let context = try makeInMemoryContext()
        let gameID = UUID()
        let playerID = UUID()

        let session = ScoringSession(gameTypeID: gameID)
        context.insert(session)
        context.insert(ScoreTurn(sessionID: session.id, playerID: playerID, delta: 32, turnIndex: 0))
        context.insert(ScoreTurn(sessionID: session.id, playerID: playerID, delta: 45, turnIndex: 1))
        try context.save()

        let sessionID = session.id
        let turns = try context.fetch(
            FetchDescriptor<ScoreTurn>(predicate: #Predicate { $0.sessionID == sessionID })
        )
        #expect(turns.count == 2)
        #expect(turns.reduce(0) { $0 + $1.delta } == 77)
        #expect(session.finishedDate == nil, "a session shouldn't count toward history until finished")
    }

    @Test func winLossSessionRoundTrips() throws {
        let context = try makeInMemoryContext()
        let winnerID = UUID()
        let session = WinLossSession(gameTypeID: UUID(), winnerPlayerID: winnerID)
        context.insert(session)
        try context.save()

        let fetched = try context.fetch(FetchDescriptor<WinLossSession>())
        #expect(fetched.first?.winnerPlayerID == winnerID)
        #expect(fetched.first?.finishedDate == nil)
    }

    @Test func coopWinLossSessionRoundTrips() throws {
        let context = try makeInMemoryContext()
        let session = CoopWinLossSession(gameTypeID: UUID(), didWin: true)
        context.insert(session)
        try context.save()

        let fetched = try context.fetch(FetchDescriptor<CoopWinLossSession>())
        #expect(fetched.first?.didWin == true)
    }
}
