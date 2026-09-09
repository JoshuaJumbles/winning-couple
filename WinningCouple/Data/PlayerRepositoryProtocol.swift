//
//  PlayerRepositoryProtocol.swift
//  WinningCouple
//
//  Created by Joshua Jumbles on 9/9/26.
//

import Foundation

protocol PlayerRepositoryProtocol {
    func fetchAll() async throws -> [PlayerProfile]
    func save(_ player: PlayerProfile) async throws
}
