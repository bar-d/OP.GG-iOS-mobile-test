//
//  SummonerGameHistoryTableHeaderView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class SummonerGameHistoryTableHeaderView: UIView {
    
    // MARK: Properties
    
    private weak var refreshButtonDelegate: RefreshButtonDelegate?
    private let topView = TopView()
    private let leagueSummaryScrollView = LeagueSummaryScrollView()
    private let recentGameAnalysisView = RecentGameAnalysisView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupRefreshButtonDelegate(_ delegate: RefreshButtonDelegate) {
        topView.setupRefreshButtonDelegate(delegate)
    }
    
    func setupContent(with summoner: Summoner) {
        topView.setupContent(with: summoner)
        leagueSummaryScrollView.setupContent(with: summoner.leagues)
    }
    
    func setupContent(with matches: Matches) {
        recentGameAnalysisView.setupContent(with: matches)
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [topView, leagueSummaryScrollView, recentGameAnalysisView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTopViewConstraints()
        setupLeagueSummaryScrollViewConstraints()
        setupRecentGameAnalysisViewConstraints()
    }
    
    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Design.topViewAndSummaryScrollViewTopConstant
            ),
            topView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            topView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            )
        ])
    }
    
    private func setupLeagueSummaryScrollViewConstraints() {
        NSLayoutConstraint.activate([
            leagueSummaryScrollView.topAnchor.constraint(
                equalTo: topView.bottomAnchor,
                constant: Design.topViewAndSummaryScrollViewTopConstant
            ),
            leagueSummaryScrollView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            leagueSummaryScrollView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            leagueSummaryScrollView.heightAnchor.constraint(
                equalToConstant: Design.leagueSummaryScrollViewHeightConstant
            )
        ])
    }
    
    private func setupRecentGameAnalysisViewConstraints() {
        NSLayoutConstraint.activate([
            recentGameAnalysisView.topAnchor.constraint(
                equalTo: leagueSummaryScrollView.bottomAnchor
            ),
            recentGameAnalysisView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            recentGameAnalysisView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            recentGameAnalysisView.heightAnchor.constraint(
                equalToConstant: Design.recentGameAnalysisViewHeightConstant
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let topViewAndSummaryScrollViewTopConstant: CGFloat = 24
    static let leagueSummaryScrollViewHeightConstant: CGFloat = 116
    static let recentGameAnalysisViewHeightConstant: CGFloat = 90
}
