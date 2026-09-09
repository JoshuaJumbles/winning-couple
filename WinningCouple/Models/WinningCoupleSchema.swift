//
//  WinningCoupleSchema.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import SwiftData

/// Single source of truth for the app's SwiftData model types, so the
/// app target and the test target build the same `ModelContainer`
/// shape from one place.
enum WinningCoupleSchema {
    static let models: [any PersistentModel.Type] = [
        PlayerProfile.self,
        GameType.self,
        ScoringSession.self,
        ScoreTurn.self,
        WinLossSession.self,
        CoopWinLossSession.self,
    ]
}
