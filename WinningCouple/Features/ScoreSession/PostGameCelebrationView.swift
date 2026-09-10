//
//  PostGameCelebrationView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI
import PhotosUI

/// What goes in the celebration badge circle — a player's initial for
/// a competitive win, or a symbol for a cooperative outcome (there's
/// no single winner to put an initial to).
enum PostGameBadge {
    case initials(String)
    case symbol(String)
}

/// The shared "congrats + notes + photo + save" screen every scoring
/// flow ends on, parameterized so both win/loss flows (and, later,
/// the points flow) can reuse it instead of duplicating layout.
struct PostGameCelebrationView: View {
    let accentColor: Color
    let badge: PostGameBadge
    let headline: String
    let subheadline: String
    @Binding var notes: String
    @Binding var photoData: Data?
    let isSaving: Bool
    let onSave: () -> Void

    @State private var photoItem: PhotosPickerItem?

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                celebrationBanner
                VStack(alignment: .leading, spacing: 16) {
                    notesField
                    photoButton
                }
                .padding(20)
            }
        }
        .safeAreaInset(edge: .bottom) {
            saveButton
        }
    }

    private var celebrationBanner: some View {
        VStack(spacing: 12) {
            Group {
                switch badge {
                case .initials(let text):
                    Text(text)
                        .font(.system(size: 30, weight: .bold))
                case .symbol(let name):
                    Image(systemName: name)
                        .font(.system(size: 26, weight: .semibold))
                }
            }
            .foregroundStyle(.white)
            .frame(width: 84, height: 84)
            .background(.white.opacity(0.22), in: Circle())

            Text(headline)
                .font(.title.bold())
                .foregroundStyle(.white)
            Text(subheadline)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.9))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 48)
        .padding(.bottom, 36)
        .background(accentColor.gradient)
    }

    private var notesField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ADD A NOTE")
                .font(.caption.bold())
                .foregroundStyle(.secondary)
            TextField("How'd it go? Any highlights worth remembering?", text: $notes, axis: .vertical)
                .lineLimit(3...6)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 14))
        }
    }

    private var photoButton: some View {
        PhotosPicker(selection: $photoItem, matching: .images) {
            HStack {
                if let photoData, let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("Photo added")
                } else {
                    Image(systemName: "camera.fill")
                    Text("Capture a memory")
                }
                Spacer()
            }
            .foregroundStyle(.secondary)
            .padding(14)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(.secondary.opacity(0.35), style: StrokeStyle(lineWidth: 2, dash: [4]))
            }
        }
        .buttonStyle(.plain)
        .onChange(of: photoItem) {
            Task {
                photoData = try? await photoItem?.loadTransferable(type: Data.self)
            }
        }
    }

    private var saveButton: some View {
        Button {
            onSave()
        } label: {
            HStack {
                Text("Save & Finish")
                if isSaving {
                    ProgressView().tint(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .disabled(isSaving)
        .padding(.horizontal, 20)
        .padding(.bottom, 8)
        .background(.bar)
    }
}

#Preview {
    PostGameCelebrationView(
        accentColor: Color(hex: PlayerColorPalette.swatches[0]),
        badge: .initials("J"),
        headline: "Jordan wins!",
        subheadline: "Scrabble",
        notes: .constant(""),
        photoData: .constant(nil),
        isSaving: false,
        onSave: {}
    )
}
