//
//  OPGGMatchesAPIRequest.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct OPGGMatchesAPIRequest: OPGGAPIRequest {
    
    typealias APIResponse = MatchesResponseDTO
    
    var httpMethod: HTTPMethod = .get
    var path: URLPath? = .matches
    var queryItems: [String : String]?
    var headers: [String : String]?
    var body: Data?
    
    init(createDate: Int? = nil) {
        if let createDate = createDate {
            queryItems = ["createDate": "\(createDate)"]
        }
    }
}
