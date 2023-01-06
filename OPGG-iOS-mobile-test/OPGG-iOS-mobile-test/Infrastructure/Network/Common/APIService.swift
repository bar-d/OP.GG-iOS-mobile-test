//
//  APIService.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation
import RxSwift

protocol APIService {
    func request<T: APIRequest>(_ request: T) -> Observable<T.APIResponse>
}

extension APIService {
    func parse<T: Decodable>(_ response: Data) -> T? {
        let parsedData = try? JSONDecoder().decode(T.self, from: response)
        
        return parsedData
    }
}
