//
//  DefaultSummonerRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

struct DefaultSummonerRepository: SummonerRepository {
    
    // MARK: Properties
    
    private let opggAPIService: OPGGAPIService
    
    init(opggAPIService: OPGGAPIService = .init()) {
        self.opggAPIService = opggAPIService
    }
}

extension DefaultSummonerRepository {
    func fetchSummonerInformation(id: String) -> Observable<Summoner> {
        let summonerRequest = OPGGSummonerAPIRequest(summonerID: id)
        
        return opggAPIService
            .request(summonerRequest)
            .compactMap { $0.summoner.toDomain() }
    }
}
