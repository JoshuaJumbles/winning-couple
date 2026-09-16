//
//  DeferredReveal.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/16/26.
//

import SwiftUI

/// Shows `placeholder` immediately, then builds `content` one run-loop
/// turn later and crossfades to it.
///
/// For a view whose first construction is a little expensive — a Swift
/// Charts `Chart` is the case that prompted this; its very first
/// layout in a process is markedly slower than every one after —
/// building it inline blocks the screen's own appearance. Deferring it
/// with a single `Task.yield()` lets the screen's own transition/paint
/// land first, so any wait happens *after* the screen is already on
/// screen instead of before it.
///
/// `placeholder` should reserve the same size `content` will end up
/// taking, so the crossfade doesn't also cause a layout jump.
///
/// Generic over both view builders — nothing here is Chart- or
/// app-specific, so this is meant to be reusable for any "might take a
/// moment to build" view, not just charts.
struct DeferredReveal<Placeholder: View, Content: View>: View {
    @ViewBuilder var placeholder: () -> Placeholder
    @ViewBuilder var content: () -> Content

    @State private var isReady = false

    var body: some View {
        ZStack {
            if isReady {
                content()
                    .transition(.opacity)
            } else {
                placeholder()
            }
        }
        .task {
            guard !isReady else { return }
            await Task.yield()
            withAnimation(.easeInOut(duration: 0.2)) {
                isReady = true
            }
        }
    }
}

#Preview {
    DeferredReveal {
        Text("\u{2026}")
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, minHeight: 140)
    } content: {
        Text("Loaded")
            .frame(maxWidth: .infinity, minHeight: 140)
    }
    .padding()
}
