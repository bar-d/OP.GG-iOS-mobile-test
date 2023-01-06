//
//  DefaultSummonerRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation
import RxSwift

struct DefaultSummonerRepository: SummonerRepository {
    
    // MARK: Properties
    
    private let opggAPIService: OPGGAPIService
    
    init(opggAPIService: OPGGAPIService = .init()) {
        self.opggAPIService = opggAPIService
    }
}

extension DefaultSummonerRepository {
    func fetchSummonerMatches(createDate: Int?) -> Observable<Matches> {
        let matchesRequest = OPGGMatchesAPIRequest(createDate: createDate)
        
        return opggAPIService.request(matchesRequest).map {
            guard let matches = $0.toDomain() else { return }
            
            return matches
        }
    }
    
    func fetchSummonerInformation(id: String) -> Observable<Summoner> {
        let summonerRequest = OPGGSummonerAPIRequest(summonerID: id)
        
        return opggAPIService.request(summonerRequest).map {
            guard let summoner = $0.summoner.toDomain() else { return }
            
            return summoner
        }
    }
}
