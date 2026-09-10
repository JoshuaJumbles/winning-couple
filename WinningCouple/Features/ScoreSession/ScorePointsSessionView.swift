//
//  ScorePointsSessionView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import Charts

struct ScorePointsSessionView: View {
    @Bindable var viewModel: ScorePointsSessionViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var scoreEntryPlayer: PlayerProfile?

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isCelebrating {
                    celebration
                } else {
                    liveScoring
                }
            }
            .navigationTitle(viewModel.gameType.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
                if !viewModel.isCelebrating {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Finish") { viewModel.requestFinish() }
                            .disabled(viewModel.turns.isEmpty)
                    }
                }
            }
        }
        .task {
            await viewModel.start()
        }
        .sheet(item: $scoreEntryPlayer) { player in
            ScoreEntrySheet(player: player) { delta in
                Task { await viewModel.addTurn(for: player, delta: delta) }
            }
        }
    }

    // MARK: Live scoring

    private var liveScoring: some View {
        VStack(spacing: 0) {
            sessionGraphCard
            HStack(spacing: 12) {
                column(for: viewModel.playerOne)
                column(for: viewModel.playerTwo)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 12)
        }
    }

    private var sessionGraphCard: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("THIS SESSION")
                .font(.caption.bold())
                .foregroundStyle(.secondary)

            if viewModel.scoreHistory.isEmpty {
                Text("Scores will appear here as you play.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .frame(height: 70, alignment: .center)
                    .frame(maxWidth: .infinity)
            } else {
                Chart(viewModel.scoreHistory) { point in
                    LineMark(x: .value("Turn", point.turnNumber), y: .value("Score", point.playerOneTotal))
                        .foregroundStyle(by: .value("Player", viewModel.playerOne.name))
                    LineMark(x: .value("Turn", point.turnNumber), y: .value("Score", point.playerTwoTotal))
                        .foregroundStyle(by: .value("Player", viewModel.playerTwo.name))
                }
                .chartForegroundStyleScale([
                    viewModel.playerOne.name: Color(hex: viewModel.playerOne.colorHex),
                    viewModel.playerTwo.name: Color(hex: viewModel.playerTwo.colorHex),
                ])
                .chartXAxis(.hidden)
                .chartLegend(.hidden)
                .frame(height: 70)
            }
        }
        .padding(14)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    private func column(for player: PlayerProfile) -> some View {
        let color = Color(hex: player.colorHex)
        return VStack(spacing: 10) {
            VStack(spacing: 4) {
                Text(initial(for: player.name))
                    .font(.subheadline.bold())
                    .foregroundStyle(.white)
                    .frame(width: 32, height: 32)
                    .background(color, in: Circle())
                Text(player.name)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Text("\(viewModel.total(for: player))")
                    .font(.title.bold())
                    .foregroundStyle(color)
            }

            List {
                ForEach(viewModel.turns(for: player)) { turn in
                    Text("+\(turn.delta)")
                        .font(.subheadline.bold())
                        .foregroundStyle(color)
                        .frame(maxWidth: .infinity)
                        .listRowBackground(color.opacity(0.14))
                }
                .onDelete { offsets in
                    Task { await viewModel.deleteTurns(for: player, at: offsets) }
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .environment(\.defaultMinListRowHeight, 36)

            Button {
                scoreEntryPlayer = player
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
            .background(color, in: RoundedRectangle(cornerRadius: 14))
        }
    }

    // MARK: Celebration

    private var celebration: some View {
        let playerOneTotal = viewModel.total(for: viewModel.playerOne)
        let playerTwoTotal = viewModel.total(for: viewModel.playerTwo)
        let highScore = max(playerOneTotal, playerTwoTotal)
        let lowScore = min(playerOneTotal, playerTwoTotal)

        return Group {
            if let winner = viewModel.winner {
                PostGameCelebrationView(
                    accentColor: Color(hex: winner.colorHex),
                    badge: .initials(initial(for: winner.name)),
                    headline: "\(winner.name) wins!",
                    subheadline: "\(viewModel.gameType.title) \u{00B7} \(highScore)\u{2013}\(lowScore)",
                    notes: $viewModel.notes,
                    photoData: $viewModel.photoData,
                    isSaving: viewModel.isSaving,
                    onSave: {
                        Task {
                            if await viewModel.finish() { dismiss() }
                        }
                    }
                )
            } else {
                PostGameCelebrationView(
                    accentColor: .gray,
                    badge: .symbol("equal.circle.fill"),
                    headline: "It's a tie!",
                    subheadline: "\(viewModel.gameType.title) \u{00B7} \(playerOneTotal)\u{2013}\(playerTwoTotal)",
                    notes: $viewModel.notes,
                    photoData: $viewModel.photoData,
                    isSaving: viewModel.isSaving,
                    onSave: {
                        Task {
                            if await viewModel.finish() { dismiss() }
                        }
                    }
                )
            }
        }
    }

    private func initial(for name: String) -> String {
        String(name.prefix(1)).uppercased()
    }
}

#Preview {
    ScorePointsSessionView(
        viewModel: ScorePointsSessionViewModel(
            gameType: GameType(title: "Scrabble", category: .competitive, scoringStyle: .points),
            playerOne: PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
            playerTwo: PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
            repository: PreviewScoringSessionRepository(),
            onFinished: {}
        )
    )
}

private final class PreviewScoringSessionRepository: ScoringSessionRepositoryProtocol {
    func fetchFinished(gameTypeID: UUID) async throws -> [ScoringSession] { [] }
    func fetchTurns(sessionID: UUID) async throws -> [ScoreTurn] { [] }
    func save(_ session: ScoringSession) async throws {}
    func addTurn(_ turn: ScoreTurn) async throws {}
    func deleteTurn(_ turn: ScoreTurn) async throws {}
}
