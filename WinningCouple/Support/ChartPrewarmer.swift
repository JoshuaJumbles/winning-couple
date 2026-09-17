//
//  ChartPrewarmer.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/16/26.
//

import SwiftUI
import Charts

/// A throwaway, effectively invisible `Chart` that exists purely to
/// eat Swift Charts' one-time first-layout cost during app launch,
/// rather than on whichever screen happens to show a real chart first.
///
/// Drop this into the view hierarchy at a moment where a brief extra
/// beat of work is invisible to the user — the launch/loading screen
/// is exactly that: the user is already looking at a spinner for an
/// expected moment, rather than a specific screen (a game's detail
/// page) that's supposed to feel instant. See `RootView`'s `.loading`
/// case.
///
/// Uses `.opacity(0.01)` rather than `.hidden()` so it stays on the
/// same live rendering path a normal, visible chart takes — the whole
/// point is to warm that exact path before it's needed for real.
struct ChartPrewarmer: View {
    private static let dummyPoints: [(x: Int, y: Int)] = [(0, 0), (1, 1)]

    var body: some View {
        Chart(Self.dummyPoints, id: \.x) { point in
            LineMark(x: .value("x", point.x), y: .value("y", point.y))
        }
        .frame(width: 1, height: 1)
        .opacity(0.01)
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}
