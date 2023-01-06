//
//  MatchesRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

protocol MatchesRepository {
    func fetchSummonerMatches(createDate: Int?) -> Observable<Matches>
}
