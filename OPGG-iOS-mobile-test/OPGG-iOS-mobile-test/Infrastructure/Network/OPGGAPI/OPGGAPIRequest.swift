//
//  OPGGAPIRequest.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

protocol OPGGAPIRequest: APIRequest { }

extension OPGGAPIRequest {
    var host: URLHost {
        .opggCodingTest
    }
}
