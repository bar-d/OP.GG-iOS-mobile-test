//
//  DefaultMatchesRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

struct DefaultMatchesRepository: MatchesRepository {
    
    // MARK: Properties
    
    private let opggAPIService: OPGGAPIService
    
    init(opggAPIService: OPGGAPIService = .init()) {
        self.opggAPIService = opggAPIService
    }
    
    
}

extension DefaultMatchesRepository {
    func fetchSummonerMatches(
        createDate: Int?,
        completion: @escaping (Result<Matches, Error>) -> Void
    ) {
        let matchesRequest = OPGGMatchesAPIRequest(createDate: createDate)
        
        opggAPIService.excute(matchesRequest) { result in
            switch result {
            case .success(let response):
                guard let matches = response.toDomain() else {
                    completion(.failure(DTOError.invalidTransformation))
                    return
                }
                
                completion(.success(matches))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
