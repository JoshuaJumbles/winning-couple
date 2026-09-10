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
    RootView(viewModel: RootViewModel(playerRepository: PreviewPlayerRepository(), gameTypeRepository: PreviewGameTypeRepository()))
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] { [] }
    func save(_ player: PlayerProfile) async throws {}
}

private final class PreviewGameTypeRepository: GameTypeRepositoryProtocol {
    func fetchAll() async throws -> [GameType] { [] }
    func save(_ gameType: GameType) async throws {}
}
