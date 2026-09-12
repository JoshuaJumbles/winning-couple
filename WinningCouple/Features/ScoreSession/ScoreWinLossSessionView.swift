//
//  ScoreWinLossSessionView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

struct ScoreWinLossSessionView: View {
    @Bindable var viewModel: ScoreWinLossSessionViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Group {
                if let winner = viewModel.declaredWinner {
                    PostGameCelebrationView(
                        accentColor: Color(hex: winner.colorHex),
                        badge: .initials(initial(for: winner.name)),
                        headline: "\(winner.name) wins!",
                        subheadline: viewModel.gameType.title,
                        notes: $viewModel.notes,
                        photoData: $viewModel.photoData,
                        isSaving: viewModel.isSaving,
                        onSave: {
                            Task {
                                if await viewModel.finish() {
                                    dismiss()
                                }
                            }
                        }
                    )
                } else {
                    winnerPicker
                }
            }
            .background(Theme.background)
            .navigationTitle(viewModel.gameType.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }

    private var winnerPicker: some View {
        VStack(spacing: 28) {
            VStack(spacing: 6) {
                Text("Who won?")
                    .font(.title.bold())
                Text("Tap the winner to finish this game.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 16)

            VStack(spacing: 18) {
                playerButton(viewModel.playerOne)
                playerButton(viewModel.playerTwo)
            }
            .padding(.horizontal, 24)

            Spacer()
        }
    }

    private func playerButton(_ player: PlayerProfile) -> some View {
        Button {
            viewModel.declareWinner(player)
        } label: {
            VStack(spacing: 10) {
                Text(initial(for: player.name))
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(.white.opacity(0.24), in: Circle())
                Text(player.name)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                Text("Tap to declare winner")
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.85))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 36)
            .background(Color(hex: player.colorHex), in: RoundedRectangle(cornerRadius: 26))
        }
        .buttonStyle(.plain)
    }

    private func initial(for name: String) -> String {
        String(name.prefix(1)).uppercased()
    }
}

#Preview {
    ScoreWinLossSessionView(
        viewModel: ScoreWinLossSessionViewModel(
            gameType: GameType(title: "Chess", category: .competitive, scoringStyle: .winLoss),
            playerOne: PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
            playerTwo: PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
            repository: PreviewWinLossSessionRepository(),
            onFinished: {}
        )
    )
}

private final class PreviewWinLossSessionRepository: WinLossSessionRepositoryProtocol {
    func fetchFinished(gameTypeID: UUID) async throws -> [WinLossSession] { [] }
    func save(_ session: WinLossSession) async throws {}
}
