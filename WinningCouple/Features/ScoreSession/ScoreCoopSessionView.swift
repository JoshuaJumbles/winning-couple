//
//  ScoreCoopSessionView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// Cooperative games have no single winner to celebrate, so this isn't
/// from the original mocks (those only designed the competitive
/// win/loss screen) — same two-big-buttons shape, just "did we win?"
/// instead of "who won?", using the sage/rose semantic colors.
struct ScoreCoopSessionView: View {
    @Bindable var viewModel: ScoreCoopSessionViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Group {
                if let didWin = viewModel.declaredOutcome {
                    PostGameCelebrationView(
                        accentColor: Color(hex: didWin ? PlayerColorPalette.coopWin : PlayerColorPalette.coopLoss),
                        badge: .symbol(didWin ? "trophy.fill" : "arrow.counterclockwise"),
                        headline: didWin ? "You won!" : "Tough one.",
                        subheadline: didWin ? "\(viewModel.gameType.title), as a team" : "\(viewModel.gameType.title) got the better of you this time",
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
                    outcomePicker
                }
            }
            .navigationTitle(viewModel.gameType.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }

    private var outcomePicker: some View {
        VStack(spacing: 28) {
            VStack(spacing: 6) {
                Text("Did you win?")
                    .font(.title.bold())
                Text("Tap the outcome to finish this game.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 16)

            VStack(spacing: 18) {
                outcomeButton(didWin: true, title: "We Won", symbol: "trophy.fill", color: Color(hex: PlayerColorPalette.coopWin))
                outcomeButton(didWin: false, title: "We Lost", symbol: "arrow.counterclockwise", color: Color(hex: PlayerColorPalette.coopLoss))
            }
            .padding(.horizontal, 24)

            Spacer()
        }
    }

    private func outcomeButton(didWin: Bool, title: String, symbol: String, color: Color) -> some View {
        Button {
            viewModel.declareOutcome(didWin: didWin)
        } label: {
            VStack(spacing: 10) {
                Image(systemName: symbol)
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(.white.opacity(0.24), in: Circle())
                Text(title)
                    .font(.title3.bold())
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 36)
            .background(color, in: RoundedRectangle(cornerRadius: 26))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ScoreCoopSessionView(
        viewModel: ScoreCoopSessionViewModel(
            gameType: GameType(title: "Pandemic", category: .cooperative, scoringStyle: .winLoss),
            repository: PreviewCoopWinLossSessionRepository(),
            onFinished: {}
        )
    )
}

private final class PreviewCoopWinLossSessionRepository: CoopWinLossSessionRepositoryProtocol {
    func fetchFinished(gameTypeID: UUID) async throws -> [CoopWinLossSession] { [] }
    func save(_ session: CoopWinLossSession) async throws {}
}
