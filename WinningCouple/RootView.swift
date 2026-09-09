//
//  RootView.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftUI

/// Temporary placeholder root. Will become the onboarding / game-list
/// navigation flow as those screens are built out.
struct RootView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Winning Couple")
                .font(.largeTitle.bold())
            Text("Project scaffold — screens coming soon.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    RootView()
}
