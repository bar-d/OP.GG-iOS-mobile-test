//
//  DefaultMatchesRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

struct DefaultMatchesRepository: MatchesRepository {
    
    // MARK: Properties
    
    private let opggAPIService: OPGGAPIService
    
    init(opggAPIService: OPGGAPIService = .init()) {
        self.opggAPIService = opggAPIService
    }
}

extension DefaultMatchesRepository {
    func fetchSummonerMatches(createDate: Int?) -> Observable<Matches> {
        let matchesRequest = OPGGMatchesAPIRequest(createDate: createDate)
        
        return opggAPIService
            .request(matchesRequest)
            .compactMap { $0.toDomain() }
    }
}
