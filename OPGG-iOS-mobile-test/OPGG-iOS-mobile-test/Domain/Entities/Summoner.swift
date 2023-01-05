//
//  Summoner.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct Summoner {
    let name: String
    let level: Int
    let profileImageURL: URL
    let leagues: [League]
}

extension Summoner {
    struct League {
        let hasResults: Bool
        let wins: Int
        let losses: Int
        let tierRank: TierRank
    }
}

extension Summoner.League {
    struct TierRank {
        let name: String
        let tier: String
        let imageURL: URL
        let leaguePoints: Int
    } 
}
