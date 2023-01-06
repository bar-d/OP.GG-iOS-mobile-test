//
//  APIService.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

protocol APIService {
    func request<T: APIRequest>(_ request: T) -> Observable<T.APIResponse>
}
