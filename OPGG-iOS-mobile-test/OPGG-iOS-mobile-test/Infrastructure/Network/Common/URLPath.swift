//
//  URLPath.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

enum URLPath {
    case summoner(summonerID: String)
    case matches
    
    var url: String {
        switch self {
        case .summoner(let summonerID):
            return "/api/summoner/\(summonerID)"
        case .matches:
            return "/api/summoner/genetory/matches"
        }
    }
}
