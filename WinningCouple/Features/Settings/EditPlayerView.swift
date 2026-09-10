//
//  EditPlayerView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import PhotosUI

struct EditPlayerView: View {
    @Bindable var viewModel: EditPlayerViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var photoItem: PhotosPickerItem?

    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    PhotosPicker(selection: $photoItem, matching: .images) {
                        avatarPreview
                    }
                    Spacer()
                }
                .listRowBackground(Color.clear)
            }
            .onChange(of: photoItem) {
                Task {
                    viewModel.photoData = try? await photoItem?.loadTransferable(type: Data.self)
                }
            }

            Section("Name") {
                TextField("Name", text: $viewModel.name)
                    .textInputAutocapitalization(.words)
            }

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

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundStyle(.red)
            }
        }
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

    @ViewBuilder
    private var avatarPreview: some View {
        if let data = viewModel.photoData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
                .frame(width: 84, height: 84)
                .clipShape(Circle())
        } else {
            Circle()
                .fill(Color(hex: viewModel.colorHex))
                .frame(width: 84, height: 84)
                .overlay {
                    Text(String(viewModel.name.prefix(1)).uppercased())
                        .font(.title.bold())
                        .foregroundStyle(.white)
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
