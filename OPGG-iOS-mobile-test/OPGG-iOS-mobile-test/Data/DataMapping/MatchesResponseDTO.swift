//
//  MatchesResponseDTO.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct MatchesResponseDTO: Decodable {
    let games: [GameDTO]
    let champions: [UsedChampionInformationDTO]
    let positions: [PositionDTO]
    let summary: SummaryDTO
}

extension MatchesResponseDTO {
    struct GameDTO: Decodable {
        let champion: ChampionDTO
        let spells: [SpellDTO]
        let items: [ItemDTO]
        let createDate: Int
        let gameLength: Int
        let gameType: String
        let stats: StatsDTO
        let peak: [URL]
        let isWin: Bool
    }
    
    struct UsedChampionInformationDTO: Decodable {
        let imageURL: URL
        let games: Int
        let wins: Int
        let losses: Int
        
        private enum CodingKeys: String, CodingKey {
            case imageURL = "imageUrl"
            case games
            case wins
            case losses
        }
    }
    
    struct PositionDTO: Decodable {
        let games: Int
        let wins: Int
        let losses: Int
        let position: String
    }
    
    struct SummaryDTO: Decodable {
        let wins: Int
        let losses: Int
        let kills: Int
        let deaths: Int
        let assists: Int
    }
    
    func toDomain() -> Matches? {
        return .init(
            games: games.map { $0.toDomain() },
            champions: champions.map { $0.toDomain() },
            positions: positions.map { $0.toDomain() },
            summary: summary.toDomain()
        )
    }
}

extension MatchesResponseDTO.GameDTO {
    struct ChampionDTO: Decodable {
        let imageURL: URL
        
        private enum CodingKeys: String, CodingKey {
            case imageURL = "imageUrl"
        }
    }
    
    struct SpellDTO: Decodable {
        let imageURL: URL
        
        private enum CodingKeys: String, CodingKey {
            case imageURL = "imageUrl"
        }
    }
    
    struct ItemDTO: Decodable {
        let imageURL: URL
        
        private enum CodingKeys: String, CodingKey {
            case imageURL = "imageUrl"
        }
    }
    
    struct StatsDTO: Decodable {
        let general: GeneralDTO
    }
    
    func toDomain() -> Matches.Game {
        return .init(
            champion: champion.toDomain(),
            spells: spells.map { $0.toDomain() },
            items: items.map { $0.toDomain() },
            createDate: createDate,
            gameLength: gameLength,
            gameType: gameType,
            stats: stats.toDomain(),
            peak: peak,
            isWin: isWin
        )
    }
}

extension MatchesResponseDTO.GameDTO.ChampionDTO {
    func toDomain() -> Matches.Game.Champion {
        return .init(iamgeURL: imageURL)
    }
}

extension MatchesResponseDTO.GameDTO.SpellDTO {
    func toDomain() -> Matches.Game.Spell {
        return .init(imageURL: imageURL)
    }
}

extension MatchesResponseDTO.GameDTO.ItemDTO {
    func toDomain() -> Matches.Game.Item {
        return .init(imageURL: imageURL)
    }
}

extension MatchesResponseDTO.GameDTO.StatsDTO {
    struct GeneralDTO: Decodable {
        let kill: Int
        let death: Int
        let assist: Int
        let contributionForKillRate: String
        let largestMultiKillString: String
        let opScoreBadge: String
    }
    
    func toDomain() -> Matches.Game.Stats {
        return .init(general: general.toDomain())
    }
}

extension MatchesResponseDTO.GameDTO.StatsDTO.GeneralDTO {
    func toDomain() -> Matches.Game.Stats.General {
        return .init(
            kill: kill,
            death: death,
            assist: assist,
            contributionForKillRate: contributionForKillRate,
            largestMultiKillString: largestMultiKillString,
            opScoreBadge: opScoreBadge
        )
    }
}

extension MatchesResponseDTO.UsedChampionInformationDTO {
    func toDomain() -> Matches.UsedChampionInformation {
        return .init(
            imageURL: imageURL,
            games: games,
            wins: wins,
            losses: losses
        )
    }
}

extension MatchesResponseDTO.PositionDTO {
    func toDomain() -> Matches.Position {
        return .init(
            games: games,
            wins: wins,
            losses: losses,
            position: position
        )
    }
}

extension MatchesResponseDTO.SummaryDTO {
    func toDomain() -> Matches.Summary {
        return .init(
            wins: wins,
            losses: losses,
            kills: kills,
            deaths: deaths,
            assists: assists
        )
    }
}
