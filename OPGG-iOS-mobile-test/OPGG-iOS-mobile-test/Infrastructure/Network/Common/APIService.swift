//
//  APIService.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

protocol APIService {
    func excute<T: APIRequest>(
        _ request: T,
        completion: @escaping (Result<T.APIResponse, APIError>) -> Void
    )
}

extension APIService {
    func parse<T: Decodable>(_ response: Data) -> T? {
        let parsedData = try? JSONDecoder().decode(T.self, from: response)
        
        return parsedData
    }
}
