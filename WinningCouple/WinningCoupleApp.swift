//
//  WinningCoupleApp.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import SwiftData

@main
struct WinningCoupleApp: App {
    let modelContainer: ModelContainer
    private let playerRepository: PlayerRepositoryProtocol

    init() {
        do {
            modelContainer = try ModelContainer(for: Schema(WinningCoupleSchema.models))
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        playerRepository = SwiftDataPlayerRepository(modelContainer: modelContainer)
    }

    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootViewModel(playerRepository: playerRepository))
        }
        .modelContainer(modelContainer)
    }
}
