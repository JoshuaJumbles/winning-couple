//
//  StubError.swift
//  WinningCoupleTests
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

/// A throwaway `Error` for tests that just need to prove a failure
/// path runs — the message is never asserted against.
struct StubError: Error {}
