//
//  EmojiPicker.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/17/26.
//

import SwiftUI
import UIKit

/// Wraps `label` (typically a `PlayerAvatar`) so tapping it slides up an
/// emoji picker where the keyboard would be.
///
/// The picker opens on a curated grid (`PlayerEmojiPalette.curated`),
/// the quick default, and a "More" tile swaps it for the system emoji
/// keyboard, which has the full set, search, and skin tones. Picking
/// either way writes to `emoji` and dismisses.
///
/// Both halves ride on a hidden `UITextField`: the curated grid is its
/// `inputView`, and the system half sets that back to `nil` and uses a
/// `textInputMode` override to ask for the emoji keyboard. SwiftUI has
/// no equivalent of either, hence the UIKit bridge.
struct EmojiPicker<Label: View>: View {
    @Binding var emoji: String?
    @ViewBuilder var label: () -> Label

    @State private var isPicking = false

    var body: some View {
        Button {
            isPicking.toggle()
        } label: {
            label()
        }
        .buttonStyle(.plain)
        .accessibilityHint("Choose an emoji avatar")
        .background {
            EmojiInputField(emoji: $emoji, isPicking: $isPicking)
                .frame(width: 1, height: 1)
                .opacity(0.02)
                .allowsHitTesting(false)
                .accessibilityHidden(true)
        }
    }
}

// MARK: - UIKit bridge

private struct EmojiInputField: UIViewRepresentable {
    @Binding var emoji: String?
    @Binding var isPicking: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> EmojiTextField {
        let field = EmojiTextField()
        field.delegate = context.coordinator
        field.autocorrectionType = .no
        field.spellCheckingType = .no
        context.coordinator.attach(to: field)
        return field
    }

    func updateUIView(_ field: EmojiTextField, context: Context) {
        context.coordinator.parent = self
        context.coordinator.refreshGrid()

        // Deferred: changing first responder synchronously in the middle
        // of a SwiftUI update fires delegate callbacks that write back to
        // `isPicking` while it's still being applied.
        if isPicking, !field.isFirstResponder {
            DispatchQueue.main.async { field.becomeFirstResponder() }
        } else if !isPicking, field.isFirstResponder {
            DispatchQueue.main.async { field.resignFirstResponder() }
        }
    }

    @MainActor
    final class Coordinator: NSObject, UITextFieldDelegate {
        var parent: EmojiInputField

        private weak var field: EmojiTextField?
        private let gridHost = UIHostingController(rootView: EmojiGridKeyboard.placeholder)
        private let gridContainer = UIInputView(frame: .zero, inputViewStyle: .keyboard)
        private lazy var systemKeyboardBar = makeSystemKeyboardBar()

        init(parent: EmojiInputField) {
            self.parent = parent
            super.init()

            gridHost.safeAreaRegions = []
            gridHost.view.backgroundColor = .clear
            gridHost.view.translatesAutoresizingMaskIntoConstraints = false
            gridContainer.allowsSelfSizing = true
            gridContainer.addSubview(gridHost.view)
            NSLayoutConstraint.activate([
                gridHost.view.topAnchor.constraint(equalTo: gridContainer.topAnchor),
                gridHost.view.leadingAnchor.constraint(equalTo: gridContainer.leadingAnchor),
                gridHost.view.trailingAnchor.constraint(equalTo: gridContainer.trailingAnchor),
                gridHost.view.bottomAnchor.constraint(equalTo: gridContainer.safeAreaLayoutGuide.bottomAnchor),
                gridHost.view.heightAnchor.constraint(equalToConstant: EmojiGridKeyboard.height),
            ])
        }

        func attach(to field: EmojiTextField) {
            self.field = field
            field.inputView = gridContainer
            refreshGrid()
        }

        func refreshGrid() {
            gridHost.rootView = EmojiGridKeyboard(
                selection: parent.emoji,
                onPick: { [weak self] in self?.commit($0) },
                onClear: { [weak self] in
                    self?.parent.emoji = nil
                    self?.field?.resignFirstResponder()
                },
                onMore: { [weak self] in self?.showSystemKeyboard() },
                onDone: { [weak self] in self?.field?.resignFirstResponder() }
            )
        }

        private func commit(_ emoji: String) {
            parent.emoji = emoji
            field?.resignFirstResponder()
        }

        private func showSystemKeyboard() {
            guard let field else { return }
            field.inputView = nil
            field.inputAccessoryView = systemKeyboardBar
            field.reloadInputViews()
        }

        private func showCuratedGrid() {
            guard let field else { return }
            field.inputView = gridContainer
            field.inputAccessoryView = nil
            if field.isFirstResponder {
                field.reloadInputViews()
            }
        }

        /// The system emoji keyboard has no "done" or "back" of its own,
        /// so this bar supplies both while it's showing.
        private func makeSystemKeyboardBar() -> UIToolbar {
            let bar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
            bar.items = [
                UIBarButtonItem(title: "Favorites", primaryAction: UIAction { [weak self] _ in
                    self?.showCuratedGrid()
                }),
                .flexibleSpace(),
                UIBarButtonItem(systemItem: .done, primaryAction: UIAction { [weak self] _ in
                    self?.field?.resignFirstResponder()
                }),
            ]
            bar.sizeToFit()
            return bar
        }

        // MARK: UITextFieldDelegate

        func textFieldDidBeginEditing(_ textField: UITextField) {
            if !parent.isPicking {
                parent.isPicking = true
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isPicking = false
            // Next time opens on the curated grid again.
            showCuratedGrid()
        }

        /// The field never actually holds text: anything typed is either
        /// an emoji, which becomes the pick, or ignored. That's also what
        /// keeps letters out if the player switches to another keyboard.
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let emoji = PlayerEmojiPalette.lastEmoji(in: string) {
                commit(emoji)
            }
            return false
        }
    }
}

/// A text field that asks for the emoji keyboard whenever it's using the
/// system keyboard.
///
/// Both overrides are public `UIResponder` API, but the behavior they
/// produce isn't formally documented. If the emoji keyboard isn't
/// enabled on the device, or a future iOS ignores the request, this
/// quietly falls back to the regular keyboard, where the globe key
/// still reaches emoji.
private final class EmojiTextField: UITextField {
    /// Without a non-nil identifier, the system restores whichever
    /// keyboard this field used last instead of honoring
    /// `textInputMode`.
    override var textInputContextIdentifier: String? { "" }

    override var textInputMode: UITextInputMode? {
        UITextInputMode.activeInputModes.first { $0.primaryLanguage == "emoji" } ?? super.textInputMode
    }

    override func caretRect(for position: UITextPosition) -> CGRect { .zero }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool { false }
}

// MARK: - Curated grid

private struct EmojiGridKeyboard: View {
    static let height: CGFloat = 290
    static var placeholder: EmojiGridKeyboard {
        EmojiGridKeyboard(selection: nil, onPick: { _ in }, onClear: {}, onMore: {}, onDone: {})
    }

    let selection: String?
    let onPick: (String) -> Void
    let onClear: () -> Void
    let onMore: () -> Void
    let onDone: () -> Void

    private let tileSize: CGFloat = 46

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Clear", action: onClear)
                    .disabled(selection == nil)
                Spacer()
                Text("Pick an avatar")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.secondary)
                Spacer()
                Button("Done", action: onDone)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)

            ScrollView {
                grid
            }
        }
    }

    private var grid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: tileSize), spacing: 6)], spacing: 6) {
            ForEach(PlayerEmojiPalette.curated, id: \.self) { emoji in
                Button {
                    onPick(emoji)
                } label: {
                    Text(emoji)
                        .font(.system(size: 30))
                        .frame(width: tileSize, height: tileSize)
                        .background(
                            selection == emoji ? Color.accentColor.opacity(0.22) : .clear,
                            in: RoundedRectangle(cornerRadius: 10)
                        )
                }
                .buttonStyle(.plain)
            }

            Button(action: onMore) {
                VStack(spacing: 1) {
                    Image(systemName: "face.smiling")
                        .font(.title3)
                    Text("More")
                        .font(.caption2.weight(.semibold))
                }
                .foregroundStyle(.secondary)
                .frame(width: tileSize, height: tileSize)
                .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
            .accessibilityLabel("More emoji")
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 12)
    }
}

#Preview {
    @Previewable @State var emoji: String? = "🦊"
    EmojiPicker(emoji: $emoji) {
        PlayerAvatar(name: "Taylor", emoji: emoji, colorHex: PlayerColorPalette.swatches[2], size: 84)
    }
}
