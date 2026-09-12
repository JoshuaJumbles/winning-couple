//
//  SettingsView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

struct SettingsView: View {
    @Bindable var viewModel: SettingsViewModel

    var body: some View {
        List {
            Section {
                Text("Tap a player to edit their name, color, or photo.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .listRowBackground(Color.clear)

            Section("Players") {
                ForEach(viewModel.players) { player in
                    NavigationLink(value: player) {
                        PlayerRow(player: player)
                    }
                    .listRowBackground(Theme.panel)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Theme.background)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        // Registered here rather than at GameListView's stack root:
        // nesting this inside GameListView's own `SettingsRoute` push
        // instead resolved reliably in testing (registering it at the
        // true stack root alongside `GameType` silently swallowed the
        // push to EditPlayerView instead — presumably a quirk of two
        // destinations at different depths for different types). The
        // original duplicate-registration warning came from
        // `SettingsViewModel` being rebuilt fresh on every presentation
        // (see `GameListViewModel.settingsViewModel`), not from where
        // this modifier lives, so keeping it here is safe now that the
        // view model is stable.
        .navigationDestination(for: PlayerProfile.self) { player in
            EditPlayerView(viewModel: viewModel.makeEditPlayerViewModel(for: player))
        }
        .task {
            await viewModel.load()
        }
    }
}

private struct PlayerRow: View {
    let player: PlayerProfile

    var body: some View {
        HStack(spacing: 12) {
            avatar
            Text(player.name)
                .font(.body.weight(.semibold))
            Spacer()
            Circle()
                .fill(Color(hex: player.colorHex))
                .frame(width: 16, height: 16)
        }
        .padding(.vertical, 2)
    }

    @ViewBuilder
    private var avatar: some View {
        if let data = player.photoData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
        } else {
            Circle()
                .fill(Color(hex: player.colorHex))
                .frame(width: 44, height: 44)
                .overlay {
                    Text(String(player.name.prefix(1)).uppercased())
                        .font(.subheadline.bold())
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView(viewModel: SettingsViewModel(playerRepository: PreviewPlayerRepository()))
    }
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] {
        [
            PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
            PlayerProfile(name: "Taylor", colorHex: PlayerColorPalette.swatches[2]),
        ]
    }
    func save(_ player: PlayerProfile) async throws {}
}
