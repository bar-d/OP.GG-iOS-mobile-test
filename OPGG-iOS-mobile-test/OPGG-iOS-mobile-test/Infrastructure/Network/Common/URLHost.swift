//
//  URLHost.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

enum URLHost {
    case opggCodingTest
    
    var url: String {
        switch self {
        case .opggCodingTest:
            return "https://codingtest.op.gg"
        }
    }
}
