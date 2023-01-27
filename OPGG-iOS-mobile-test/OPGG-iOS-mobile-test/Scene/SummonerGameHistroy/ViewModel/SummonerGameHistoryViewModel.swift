//
//  SummonerGameHistoryViewModel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import Foundation

final class SummonerGameHistoryViewModel: ViewModel {
    
    // MARK: Properties
    
    private var games: [Matches.Game] = []
    private var createDate: Int?
    private let summonerUseCase = SummonerUseCase()
    private let matchesUseCase = MatchesUseCase()
    
    private let output: Output
    lazy var input = Input(
        refreshButtonDidTap: fetchSummonerAllInformation,
        appDidStart: fetchSummonerAllInformation,
        updateGames: fetchSummonerMatches
    )
    
    // MARK: - Initializers
    
    init(output: Output) {
        self.output = output
    }
    
    // MARK: - Methods
    
    private func fetchSummonerAllInformation() {
        summonerUseCase.fetchSummonerInformation { [weak self] result in
            switch result {
            case .success(let summoner):
                self?.output.fetchSummoner(summoner)
            case .failure(let error):
                self?.output.errorOccured(error)
            }
        }
        
        matchesUseCase.fetchSummonerMatches { [weak self] result in
            switch result {
            case .success(let matches):
                self?.createDate = matches.games.last?.createDate
                self?.games.append(contentsOf: matches.games)
                self?.output.fetchMatches(matches)
            case .failure(let error):
                self?.output.errorOccured(error)
            }
        }
    }
    
    private func fetchSummonerMatches() {
        matchesUseCase.fetchSummonerMatches(
            createDate: self.createDate
        ) { [weak self] result in
            switch result {
            case .success(let matches):
                self?.createDate = matches.games.last?.createDate
                self?.games.append(contentsOf: matches.games)
                self?.output.fetchGames(matches.games)
            case .failure(let error):
                self?.output.errorOccured(error)
            }
        }
    }
}

extension SummonerGameHistoryViewModel {
    struct Input {
        let refreshButtonDidTap: () -> Void
        let appDidStart: () -> Void
        let updateGames: () -> Void
    }
    
    struct Output {
        let fetchSummoner: (Summoner) -> Void
        let fetchMatches: (Matches) -> Void
        let fetchGames: ([Matches.Game]) -> Void
        let errorOccured: (Error) -> Void
    }
}
