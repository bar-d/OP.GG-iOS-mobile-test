//
//  SummonerRepository.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import RxSwift

protocol SummonerRepository {
    func fetchSummonerInformation(id: String) -> Observable<Summoner>
}
