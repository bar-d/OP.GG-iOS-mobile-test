//
//  MatchesUseCase.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

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
    
    func fetchSummonerMatches(createDate: Int? = nil) -> Observable<Matches> {
        
        return repository.fetchSummonerMatches(createDate: createDate).map { $0 }
    }
}
