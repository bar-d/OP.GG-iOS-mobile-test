//
//  SummonerGameHistoryViewModel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import Foundation

struct SummonerGameHistoryViewModel {
    
    // MARK: Properties
    
    private let summonerUseCase = SummonerUseCase()
    private let matchesUseCase = MatchesUseCase()
    
    // MARK: - Methods
    
    func fetchSummonerAllInformation(
        completion: @escaping (Result<Summoner, Error>) -> Void
    ) {
        summonerUseCase.fetchSummonerInformation { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summoner):
                    completion(.success(summoner))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func fetchSummonerMatches(
        createDate: Int? = nil,
        completion: @escaping (Result<Matches, Error>) -> Void
    ) {
        matchesUseCase.fetchSummonerMatches(createDate: createDate) { result in
            switch result {
            case .success(let matches):
                completion(.success(matches))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
