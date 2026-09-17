//
//  EditPlayerView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

struct EditPlayerView: View {
    @Bindable var viewModel: EditPlayerViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    EmojiPicker(emoji: $viewModel.emoji) {
                        PlayerAvatar(name: viewModel.name, emoji: viewModel.emoji, colorHex: viewModel.colorHex, size: 84)
                    }
                    Spacer()
                }
                .listRowBackground(Color.clear)
            } footer: {
                Text("Tap to pick an emoji avatar.")
                    .frame(maxWidth: .infinity)
            }

            Section("Name") {
                TextField("Name", text: $viewModel.name)
                    .textInputAutocapitalization(.words)
            }
            .listRowBackground(Theme.panel)

            Section("Color") {
                HStack(spacing: 10) {
                    ForEach(PlayerColorPalette.swatches, id: \.self) { hex in
                        Circle()
                            .fill(Color(hex: hex))
                            .frame(width: 28, height: 28)
                            .overlay {
                                if viewModel.colorHex == hex {
                                    Circle().strokeBorder(.primary, lineWidth: 2).padding(-3)
                                }
                            }
                            .onTapGesture { viewModel.colorHex = hex }
                    }
                }
                .padding(.vertical, 4)
            }
            .listRowBackground(Theme.panel)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundStyle(.red)
            }
        }
        .scrollContentBackground(.hidden)
        .background(Theme.background)
        .navigationTitle(viewModel.player.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                if viewModel.isSaving {
                    ProgressView()
                } else {
                    Button("Save") {
                        Task {
                            if await viewModel.save() { dismiss() }
                        }
                    }
                    .disabled(!viewModel.canSave)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditPlayerView(
            viewModel: EditPlayerViewModel(
                player: PlayerProfile(name: "Jordan", colorHex: PlayerColorPalette.swatches[0]),
                playerRepository: PreviewPlayerRepository(),
                onSaved: {}
            )
        )
    }
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] { [] }
    func save(_ player: PlayerProfile) async throws {}
}
