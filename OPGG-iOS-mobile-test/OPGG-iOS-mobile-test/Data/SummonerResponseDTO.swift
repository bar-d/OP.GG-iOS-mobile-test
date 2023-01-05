//
//  SummonerResponseDTO.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct SummonerResponseDTO: Decodable {
    let summoner: SummonerDTO
}

extension SummonerResponseDTO {
    struct SummonerDTO: Decodable {
        let name: String
        let level: Int
        let profileImageURL: URL
        let leagues: [LeagueDTO]
        
        private enum CodingKeys: String, CodingKey {
            case name
            case level
            case profileImageURL = "profileImageUrl"
            case leagues
        }
    }
}

extension SummonerResponseDTO.SummonerDTO {
    struct LeagueDTO: Decodable {
        let hasResults: Bool
        let wins: Int
        let losses: Int
        let tierRank: TierRankDTO
    }
    
    func toDomain() -> Summoner {
        return .init(
            name: name,
            level: level,
            profileImageURL: profileImageURL,
            leagues: leagues.map { $0.toDomain() }
        )
    }
}

extension SummonerResponseDTO.SummonerDTO.LeagueDTO {
    struct TierRankDTO: Decodable {
        let name: String
        let tier: String
        let imageURL: URL
        let leaguePoints: Int
        
        private enum CodingKeys: String, CodingKey {
            case name
            case tier
            case imageURL = "imageUrl"
            case leaguePoints = "lp"
        }
    }
    
    func toDomain() -> Summoner.League {
        return .init(
            hasResults: hasResults,
            wins: wins,
            losses: losses,
            tierRank: tierRank.toDomain()
        )
    }
}

extension SummonerResponseDTO.SummonerDTO.LeagueDTO.TierRankDTO {
    func toDomain() -> Summoner.League.TierRank {
        return .init(
            name: name,
            tier: tier,
            imageURL: imageURL,
            leaguePoints: leaguePoints
        )
    }
}
