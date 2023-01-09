//
//  Rank.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

enum Rank {
    case type(of: String)
    
    var value: String {
        switch self {
        case .type(let type):
            if type == "솔랭" {
                return "솔로 랭크"
            }
            
            return type
        }
    }
}
