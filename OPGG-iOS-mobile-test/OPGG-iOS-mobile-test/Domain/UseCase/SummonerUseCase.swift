//
//  SummonerUseCase.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

struct SummonerUseCase {
    
    // MARK: Properties
    
    private let repository: SummonerRepository
    private let id: String
    
    // MARK: - Initializers
    
    init(
        repository: SummonerRepository = DefaultSummonerRepository(),
        id: String = "genetory"
    ) {
        self.repository = repository
        self.id = id
    }
    
    // MARK: - Methods
    
    func fetchSummonerInformation(id: String = "genetory") -> Observable<Summoner> {
        return repository.fetchSummonerInformation(id: self.id).map { $0 }
    }
}
