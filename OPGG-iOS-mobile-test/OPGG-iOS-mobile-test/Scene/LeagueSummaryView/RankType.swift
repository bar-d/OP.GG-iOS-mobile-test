//
//  RankType.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

enum RankType {
    case solo
    case flex
    
    var name: String {
        switch self {
        case .solo:
            return "솔로랭크"
        case .flex:
            return "자유 5:5 랭크"
        }
    }
}
