//
//  SummoneGameHistoryViewModel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/07.
//

import RxSwift
import RxRelay

struct SummoneGameHistoryViewModel: ViewModel {
    
    // MARK: Properties
    
    var disposeBag = DisposeBag()
    private let summonerUseCase: SummonerUseCase
    private let matchesUseCase: MatchesUseCase
    
    // MARK: - Initializers
    
    init(
        summonerUseCase: SummonerUseCase = SummonerUseCase(),
        matchesUseCase: MatchesUseCase = MatchesUseCase()
    ) {
        self.summonerUseCase = summonerUseCase
        self.matchesUseCase = matchesUseCase
    }
    
    // MARK: - Methods
    
    func transfrom(_ input: Input) -> Output {
        let loadSummonerInformation = Observable.merge(
            input.viewDidLoad,
            input.refreshButtonDidTap
        ).flatMap { _ in

            return Observable.combineLatest(
                summonerUseCase.fetchSummonerInformation(),
                matchesUseCase.fetchSummonerMatches()
            )
        }
        
        return .init(
            loadSummonerInformation: loadSummonerInformation,
            loadSummonerMatches: .never(),
            lastCreateDate: .never()
        )
    }
}

extension SummoneGameHistoryViewModel {
    struct Input {
        let viewDidLoad: Observable<Void>
        let refreshButtonDidTap: Observable<Void>
        let scrollDidEnd: Observable<[IndexPath]>
    }
    
    struct Output {
        let loadSummonerInformation: Observable<(Summoner, Matches)>
        let loadSummonerMatches: Observable<Matches>
        let lastCreateDate: Observable<Matches>
    }
}
