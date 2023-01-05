//
//  DefaultSummonerRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct DefaultSummonerRepository: SummonerRepository {
    
    // MARK: Properties
    
    private let opggAPIService: OPGGAPIService
    
    init(opggAPIService: OPGGAPIService = .init()) {
        self.opggAPIService = opggAPIService
    }
}

extension DefaultSummonerRepository {
    func fetchSummonerInformation(
        id: String,
        completion: @escaping (Result<Summoner, Error>) -> Void
    ) {
        let summonerRequest = OPGGSummonerAPIRequest(summonerID: id)
        
        opggAPIService.excute(summonerRequest) { result in
            switch result {
            case .success(let response):
                guard let summoner = response.summoner.toDomain() else {
                    completion(.failure(DTOError.invalidTransformation))     
                    return
                }
                
                completion(.success(summoner))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
