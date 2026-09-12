//
//  AddGameTypeView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import PhotosUI

struct AddGameTypeView: View {
    @Bindable var viewModel: AddGameTypeViewModel
    let onCancel: () -> Void

    @State private var thumbnailItem: PhotosPickerItem?

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        PhotosPicker(selection: $thumbnailItem, matching: .images) {
                            if let data = viewModel.thumbnailData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 72, height: 72)
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                            } else {
                                RoundedRectangle(cornerRadius: 18)
                                    .strokeBorder(.secondary.opacity(0.4), style: StrokeStyle(lineWidth: 2, dash: [4]))
                                    .frame(width: 72, height: 72)
                                    .overlay {
                                        Image(systemName: "camera.fill")
                                            .foregroundStyle(.secondary)
                                    }
                            }
                        }
                        Spacer()
                    }
                    .onChange(of: thumbnailItem) {
                        Task {
                            viewModel.thumbnailData = try? await thumbnailItem?.loadTransferable(type: Data.self)
                        }
                    }
                    .listRowBackground(Color.clear)
                }

                Section("Game Title") {
                    TextField("e.g. Scrabble", text: $viewModel.title)
                }
                .listRowBackground(Theme.panel)

                Section("Type") {
                    Picker("Type", selection: $viewModel.category) {
                        Text("Competitive").tag(GameCategory.competitive)
                        Text("Cooperative").tag(GameCategory.cooperative)
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                }
                .listRowBackground(Theme.panel)

                Section {
                    Picker("Scoring", selection: $viewModel.scoringStyle) {
                        Text("Points").tag(ScoringStyle.points)
                        Text("Win / Loss").tag(ScoringStyle.winLoss)
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    .disabled(viewModel.isScoringStyleLocked)
                } header: {
                    Text("Scoring")
                } footer: {
                    if viewModel.isScoringStyleLocked {
                        Text("Cooperative games are scored win/loss against the game itself.")
                    } else {
                        Text("Points: log a running score each turn, with a live graph. Win/Loss: just tap who won.")
                    }
                }
                .listRowBackground(Theme.panel)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage).foregroundStyle(.red)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Theme.background)
            .navigationTitle("New Game")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: onCancel)
                }
                ToolbarItem(placement: .confirmationAction) {
                    if viewModel.isSaving {
                        ProgressView()
                    } else {
                        Button("Save") {
                            Task { await viewModel.save() }
                        }
                        .disabled(!viewModel.canSave)
                    }
                }
            }
        }
    }
}

#Preview {
    AddGameTypeView(
        viewModel: AddGameTypeViewModel(gameTypeRepository: PreviewGameTypeRepository(), onSaved: {}),
        onCancel: {}
    )
}

private final class PreviewGameTypeRepository: GameTypeRepositoryProtocol {
    func fetchAll() async throws -> [GameType] { [] }
    func save(_ gameType: GameType) async throws {}
}
