//
//  GameDetailView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import Charts

struct GameDetailView: View {
    @Bindable var viewModel: GameDetailViewModel

    var body: some View {
        Group {
            if viewModel.hasNoSessions {
                emptyState
            } else {
                populatedContent
            }
        }
        .navigationTitle(viewModel.gameType.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $viewModel.isPresentingScoreSession) {
            scoreSessionSheet
        }
        .task {
            await viewModel.load()
        }
    }

    @ViewBuilder
    private var scoreSessionSheet: some View {
        if viewModel.gameType.category == .cooperative {
            ScoreCoopSessionView(viewModel: viewModel.makeScoreCoopSessionViewModel())
        } else if viewModel.gameType.scoringStyle == .points {
            if let pointsViewModel = viewModel.makeScorePointsSessionViewModel() {
                ScorePointsSessionView(viewModel: pointsViewModel)
            } else {
                ProgressView()
            }
        } else if let winLossViewModel = viewModel.makeScoreWinLossSessionViewModel() {
            ScoreWinLossSessionView(viewModel: winLossViewModel)
        } else {
            // Players haven't finished loading yet — practically
            // unreachable, since the button that presents this sheet
            // is disabled until they have.
            ProgressView()
        }
    }

    private var populatedContent: some View {
        List {
            Section {
                if viewModel.isCompetitive {
                    winHistoryCard
                } else if let record = viewModel.coopRecord {
                    coopRecordCard(record)
                }
                scoreNewSessionButton
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)

            Section("Past Sessions") {
                ForEach(viewModel.sessions) { session in
                    SessionRow(session: session)
                }
            }
        }
        .listStyle(.plain)
    }

    private var winHistoryCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("WIN HISTORY")
                .font(.caption.bold())
                .foregroundStyle(.secondary)

            Chart(viewModel.winHistory) { point in
                LineMark(x: .value("Session", point.sessionIndex), y: .value("Wins", point.playerOneWins))
                    .foregroundStyle(by: .value("Player", viewModel.playerOne?.name ?? "Player One"))
                LineMark(x: .value("Session", point.sessionIndex), y: .value("Wins", point.playerTwoWins))
                    .foregroundStyle(by: .value("Player", viewModel.playerTwo?.name ?? "Player Two"))
            }
            .chartForegroundStyleScale([
                (viewModel.playerOne?.name ?? "Player One"): Color(hex: viewModel.playerOne?.colorHex ?? PlayerColorPalette.default),
                (viewModel.playerTwo?.name ?? "Player Two"): Color(hex: viewModel.playerTwo?.colorHex ?? PlayerColorPalette.default),
            ])
            .chartXAxis(.hidden)
            .frame(height: 140)
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 18))
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }

    private func coopRecordCard(_ record: CoopRecord) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("RECORD")
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                Text("\(record.wins) wins \u{00B7} \(record.losses) losses")
                    .font(.title3.weight(.semibold))
            }
            Spacer()
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 18))
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }

    private var scoreNewSessionButton: some View {
        Button {
            viewModel.isPresentingScoreSession = true
        } label: {
            Label("Score a New Session", systemImage: "plus")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .disabled(viewModel.playerOne == nil || viewModel.playerTwo == nil)
        .padding(.horizontal, 20)
        .padding(.top, 14)
        .padding(.bottom, 4)
    }

    private var emptyState: some View {
        VStack(spacing: 8) {
            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.system(size: 34))
                .foregroundStyle(.secondary)
            Text("No sessions yet")
                .font(.title3.bold())
            Text("Score your first session below to start the history for \(viewModel.gameType.title).")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            Button {
                viewModel.isPresentingScoreSession = true
            } label: {
                Label("Score a New Session", systemImage: "plus")
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.playerOne == nil || viewModel.playerTwo == nil)
            .padding(.top, 8)
        }
        .frame(maxHeight: .infinity)
    }
}

private struct SessionRow: View {
    let session: GameSessionSummary

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(session.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.body.weight(.semibold))
                Text(session.resultText)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if session.hasNote {
                Image(systemName: "doc.text")
                    .foregroundStyle(.secondary)
            }
            if session.hasPhoto {
                Image(systemName: "photo")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    NavigationStack {
        GameDetailView(
            viewModel: GameDetailViewModel(
                gameType: GameType(title: "Scrabble", category: .competitive, scoringStyle: .points),
                playerRepository: PreviewPlayerRepository(),
                scoringSessionRepository: PreviewScoringSessionRepository(),
                winLossSessionRepository: PreviewWinLossSessionRepository(),
                coopWinLossSessionRepository: PreviewCoopWinLossSessionRepository()
            )
        )
    }
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] { [] }
    func save(_ player: PlayerProfile) async throws {}
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
