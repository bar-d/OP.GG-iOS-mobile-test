//
//  Matches.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct Matches {
    let games: [Game]
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
