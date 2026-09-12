//
//  GameListView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

struct GameListView: View {
    @Bindable var viewModel: GameListViewModel
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if viewModel.hasNoGames {
                    emptyState
                } else {
                    List {
                        if !viewModel.competitiveGames.isEmpty {
                            Section("Competitive") {
                                ForEach(viewModel.competitiveGames) { game in
                                    NavigationLink(value: game) {
                                        GameRow(game: game)
                                    }
                                    .listRowBackground(Theme.panel)
                                }
                            }
                        }
                        if !viewModel.cooperativeGames.isEmpty {
                            Section("Cooperative") {
                                ForEach(viewModel.cooperativeGames) { game in
                                    NavigationLink(value: game) {
                                        GameRow(game: game)
                                    }
                                    .listRowBackground(Theme.panel)
                                }
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .background(Theme.background)
            .navigationTitle("Winning Couple")
            .navigationDestination(for: GameType.self) { game in
                GameDetailView(viewModel: viewModel.makeGameDetailViewModel(for: game))
            }
            // A plain marker type pushed onto the same path as `GameType`,
            // rather than a `.navigationDestination(isPresented:)` — mixing
            // that boolean-driven style with a value-based one further
            // down the tree (SettingsView's own `PlayerProfile` destination)
            // is what caused SwiftUI's "navigationDestination ... declared
            // earlier on the stack" warning, and silently broke the push
            // to EditPlayerView entirely. Keeping everything path-based
            // avoids both.
            .navigationDestination(for: SettingsRoute.self) { _ in
                SettingsView(viewModel: viewModel.settingsViewModel)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        path.append(SettingsRoute())
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.isPresentingAddGame = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isPresentingAddGame) {
                AddGameTypeView(viewModel: viewModel.makeAddGameTypeViewModel()) {
                    viewModel.isPresentingAddGame = false
                }
            }
            .task {
                await viewModel.load()
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 8) {
            Image(systemName: "square.grid.2x2")
                .font(.system(size: 34))
                .foregroundStyle(.secondary)
            Text("No games yet")
                .font(.title3.bold())
            Text("Add your first game to start tracking who's winning, session by session.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            Button("Add a Game", systemImage: "plus") {
                viewModel.isPresentingAddGame = true
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 8)
        }
    }
}

/// An empty value pushed onto the stack's path purely to trigger
/// `SettingsView`'s `.navigationDestination(for:)` — see the comment
/// where it's registered in `GameListView.body`.
private struct SettingsRoute: Hashable {}

private struct GameRow: View {
    let game: GameType

    var body: some View {
        HStack(spacing: 13) {
            thumbnail
            VStack(alignment: .leading, spacing: 3) {
                Text(game.title)
                    .font(.body.weight(.semibold))
                Text("No sessions yet")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    @ViewBuilder
    private var thumbnail: some View {
        if let data = game.thumbnailData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 14))
        } else {
            RoundedRectangle(cornerRadius: 14)
                .fill(placeholderColor)
                .frame(width: 48, height: 48)
                .overlay {
                    Text(initials)
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                }
        }
    }

    private var initials: String {
        let letters = game.title.split(separator: " ").prefix(2).compactMap(\.first)
        return String(letters).uppercased()
    }

    /// Deterministic so a game's thumbnail color doesn't shuffle on every reload.
    private var placeholderColor: Color {
        let index = abs(game.id.hashValue) % PlayerColorPalette.swatches.count
        return Color(hex: PlayerColorPalette.swatches[index])
    }
}

#Preview {
    GameListView(
        viewModel: GameListViewModel(
            gameTypeRepository: PreviewGameTypeRepository(),
            playerRepository: PreviewPlayerRepository(),
            scoringSessionRepository: PreviewScoringSessionRepository(),
            winLossSessionRepository: PreviewWinLossSessionRepository(),
            coopWinLossSessionRepository: PreviewCoopWinLossSessionRepository()
        )
    )
}

private final class PreviewGameTypeRepository: GameTypeRepositoryProtocol {
    func fetchAll() async throws -> [GameType] { [] }
    func save(_ gameType: GameType) async throws {}
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
