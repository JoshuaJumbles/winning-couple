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
            case .home(let players):
                HomePlaceholderView(players: players)
            }
        }
        .task {
            await viewModel.loadPhase()
        }
    }
}

#Preview {
    RootView(viewModel: RootViewModel(playerRepository: PreviewPlayerRepository()))
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] { [] }
    func save(_ player: PlayerProfile) async throws {}
}
