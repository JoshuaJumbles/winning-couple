//
//  Theme.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/11/26.
//

import SwiftUI

/// Centralized, compile-checked access to the app's semantic colors.
///
/// Each color is still backed by an asset-catalog colorset
/// (`AppBackground`, `Panel`) so we keep automatic dark-mode handling
/// and Xcode's color-picker/preview convenience — but every call site
/// in the app goes through this enum instead of a raw
/// `Color("AppBackground")` string literal. A typo or renamed
/// colorset now fails to compile here, in one place, instead of
/// silently resolving to a magenta placeholder wherever it was
/// mistyped.
///
/// Two colors for now: `background` behind a whole screen, `panel`
/// for the cards/rows that sit on top of it. A shared corner-radius
/// scale and card shadow are natural next additions here, but are
/// deliberately left out until a second real use case asks for them.
enum Theme {
    /// The screen-level background behind every scroll view, list,
    /// and form in the app.
    static let background = Color("AppBackground")

    /// The card/row surface that sits on top of `background` — table
    /// rows, form sections, the session-graph card.
    static let panel = Color("Panel")
}
