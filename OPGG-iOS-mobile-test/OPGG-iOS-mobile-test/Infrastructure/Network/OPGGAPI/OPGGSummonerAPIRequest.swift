//
//  OPGGSummonerAPIRequest.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct OPGGSummonerAPIRequest: OPGGAPIRequest {
    
    typealias APIResponse = SummonerResponseDTO
    
    var httpMethod: HTTPMethod = .get
    var path: URLPath?
    var queryItems: [String : String]?
    var headers: [String : String]?
    var body: Data?
    
    init(summonerID: String) {
        path = .summoner(summonerID: summonerID)
    }
}
