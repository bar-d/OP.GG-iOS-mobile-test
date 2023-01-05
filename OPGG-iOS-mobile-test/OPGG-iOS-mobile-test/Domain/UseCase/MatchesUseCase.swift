//
//  MatchesUseCase.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct MatchesUseCase {
    
    // MARK: Properties
    
    private let repository: MatchesRepository
    private let createDate: Int?
    
    // MARK: - Initializers
    
    init(
        repository: MatchesRepository = DefaultMatchesRepository(),
        createDate: Int? = nil
    ) {
        self.repository = repository
        self.createDate = createDate
    }
    
    // MARK: - Methods
    
    func fetchSummonerMatches(
        createDate: Int? = nil,
        completion: @escaping (Result<Matches, Error>) -> Void
    ) {
        repository.fetchSummonerMatches(createDate: createDate) { result in
            switch result {
            case .success(let matches):
                completion(.success(matches))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
