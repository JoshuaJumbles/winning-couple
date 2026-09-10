//
//  RootView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

struct RootView: View {
    let viewModel: RootViewModel

    var body: some View {
        Group {
            switch viewModel.phase {
            case .loading:
                ProgressView()
            case .onboarding:
                OnboardingView(viewModel: viewModel.makeOnboardingViewModel()) {
                    Task { await viewModel.onboardingFinished() }
                }
            case .home:
                GameListView(viewModel: viewModel.makeGameListViewModel())
            }
        }
        .task {
            await viewModel.loadPhase()
        }
    }
}

#Preview {
    RootView(viewModel: RootViewModel(
        playerRepository: PreviewPlayerRepository(),
        gameTypeRepository: PreviewGameTypeRepository(),
        scoringSessionRepository: PreviewScoringSessionRepository(),
        winLossSessionRepository: PreviewWinLossSessionRepository(),
        coopWinLossSessionRepository: PreviewCoopWinLossSessionRepository()
    ))
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] { [] }
    func save(_ player: PlayerProfile) async throws {}
}

private final class PreviewGameTypeRepository: GameTypeRepositoryProtocol {
    func fetchAll() async throws -> [GameType] { [] }
    func save(_ gameType: GameType) async throws {}
}

private final class PreviewScoringSessionRepository: ScoringSessionRepositoryProtocol {
    func fetchFinished(gameTypeID: UUID) async throws -> [ScoringSession] { [] }
    func fetchTurns(sessionID: UUID) async throws -> [ScoreTurn] { [] }
    func save(_ session: ScoringSession) async throws {}
    func addTurn(_ turn: ScoreTurn) async throws {}
    func deleteTurn(_ turn: ScoreTurn) async throws {}
}

private final class PreviewWinLossSessionRepository: WinLossSessionRepositoryProtocol {
    func fetchFinished(gameTypeID: UUID) async throws -> [WinLossSession] { [] }
    func save(_ session: WinLossSession) async throws {}
}

private final class PreviewCoopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol {
    func fetchFinished(gameTypeID: UUID) async throws -> [CoopWinLossSession] { [] }
    func save(_ session: CoopWinLossSession) async throws {}
}
