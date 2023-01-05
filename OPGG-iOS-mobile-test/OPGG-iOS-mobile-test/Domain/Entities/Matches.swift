//
//  Matches.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct Matches {
    let games: [Game]
    let champions: [UsedChampionInformation]
    let positions: [Position]
    let summary: Summary
}

struct Game {
    let champion: Champion
    let spells: [Spell]
    let items: [Item]
    let createDate: Int
    let gameLength: Int
    let gameType: String
    let stats: Stats
    let peak: [URL]
    let isWin: Bool
}

struct Champion {
    let iamgeURL: URL
}

struct Spell {
    let imageURL: URL
}

struct Item {
    let imageURL: URL
}

struct Stats {
    let general: General
}

struct General {
    let kill: Int
    let death: Int
    let assist: Int
    let contributionForKillRate: String
    let opScoreBadge: String
}

struct UsedChampionInformation {
    let imageURL: URL
    let games: Int
    let wins: Int
    let losses: Int
}

struct Position {
    let games: Int
    let wins: Int
    let losses: Int
    let position: String
}

struct Summary {
    let wins: Int
    let losses: Int
    let kills: Int
    let deaths: Int
    let assists: Int
}
