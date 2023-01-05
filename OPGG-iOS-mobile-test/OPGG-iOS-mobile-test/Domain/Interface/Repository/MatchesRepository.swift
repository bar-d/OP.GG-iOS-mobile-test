//
//  MatchesRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

protocol MatchesRepository {
    func fetchSummonerMatches(
        createDate: Int?,
        completion: @escaping (Result<Matches, Error>) -> Void
    )
}
