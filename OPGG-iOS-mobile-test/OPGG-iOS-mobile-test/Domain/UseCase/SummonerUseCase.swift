//
//  SummonerUseCase.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

struct SummonerUseCase {
    
    // MARK: Properties
    
    private let repository: SummonerRepository
    
    // MARK: - Initializers
    
    init(
        repository: SummonerRepository = DefaultSummonerRepository()
    ) {
        self.repository = repository
    }
    
    // MARK: - Methods
    
    func fetchSummonerInformation(
        id: String = "genetory",
        completion: @escaping (Result<Summoner, Error>) -> Void
    ) {
        repository.fetchSummonerInformation(id: id) { result in
            switch result {
            case .success(let summoner):
                completion(.success(summoner))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
