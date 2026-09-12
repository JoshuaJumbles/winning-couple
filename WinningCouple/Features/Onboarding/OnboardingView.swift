//
//  OnboardingView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import PhotosUI

struct OnboardingView: View {
    let viewModel: OnboardingViewModel
    let onFinished: () -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Image(systemName: "person.2.circle.fill")
                        .font(.system(size: 44))
                        .foregroundStyle(.tint)
                    Text("Winning Couple")
                        .font(.largeTitle.bold())
                    Text("Track your game nights together, and see who's really winning.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 24)

                PlayerFormSection(label: "Player One", player: viewModel.playerOne)
                PlayerFormSection(label: "Player Two", player: viewModel.playerTwo)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
        }
        .background(Theme.background)
        .safeAreaInset(edge: .bottom) {
            Button {
                Task {
                    if await viewModel.finish() {
                        onFinished()
                    }
                }
            } label: {
                HStack {
                    Text("Let's Play")
                    if viewModel.isSaving {
                        ProgressView().tint(.white)
                    } else {
                        Image(systemName: "chevron.right")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!viewModel.canFinish || viewModel.isSaving)
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
            .background(.bar)
        }
    }
}

private struct PlayerFormSection: View {
    let label: String
    @Bindable var player: DraftPlayer
    @State private var photoItem: PhotosPickerItem?

    var body: some View {
        VStack(spacing: 12) {
            Text(label.uppercased())
                .font(.caption.bold())
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            PhotosPicker(selection: $photoItem, matching: .images) {
                if let photoData = player.photoData, let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .strokeBorder(.secondary.opacity(0.4), style: StrokeStyle(lineWidth: 2, dash: [4]))
                        .frame(width: 64, height: 64)
                        .overlay {
                            Image(systemName: "camera.fill")
                                .foregroundStyle(.secondary)
                        }
                }
            }
            .onChange(of: photoItem) {
                Task {
                    player.photoData = try? await photoItem?.loadTransferable(type: Data.self)
                }
            }

            TextField("Name", text: $player.name)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.words)

            HStack(spacing: 10) {
                ForEach(PlayerColorPalette.swatches, id: \.self) { hex in
                    Circle()
                        .fill(Color(hex: hex))
                        .frame(width: 26, height: 26)
                        .overlay {
                            if player.colorHex == hex {
                                Circle().strokeBorder(.primary, lineWidth: 2).padding(-3)
                            }
                        }
                        .onTapGesture { player.colorHex = hex }
                }
            }
        }
        .padding(18)
        .background(Theme.panel, in: RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    OnboardingView(
        viewModel: OnboardingViewModel(playerRepository: PreviewPlayerRepository()),
        onFinished: {}
    )
}

private final class PreviewPlayerRepository: PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile] { [] }
    func save(_ player: PlayerProfile) async throws {}
}
