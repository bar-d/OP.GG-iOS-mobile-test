//
//  SummonerGameHistoryViewController.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class SummonerGameHistoryViewController: UIViewController {

    // MARK: Properties
    
    private let topView = TopView()
    private let leagueSummaryScrollView = LeagueSummaryScrollView()
    private let recentGameAnalysisView = RecentGameAnalysisView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupBackgroundColor(.paleGrey)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
    
    private func setupSubviews() {
        [topView, leagueSummaryScrollView, recentGameAnalysisView]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTopViewConstraints()
        setupLeagueSummaryScrollViewConstraints()
        setupRecentGameAnalysisViewConstraints()
    }
    
    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(
                equalTo: topLayoutGuide.bottomAnchor,
                constant: Design.topViewAndSummaryScrollViewtopConstant
            ),
            topView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            topView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            )
        ])
    }
    
    private func setupLeagueSummaryScrollViewConstraints() {
        NSLayoutConstraint.activate([
            leagueSummaryScrollView.topAnchor.constraint(
                equalTo: topView.bottomAnchor,
                constant: Design.topViewAndSummaryScrollViewtopConstant
            ),
            leagueSummaryScrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            leagueSummaryScrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
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
                equalTo: view.leadingAnchor
            ),
            recentGameAnalysisView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            recentGameAnalysisView.heightAnchor.constraint(
                equalToConstant: Design.recentGameAnalysisViewHeightConstant
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let topViewAndSummaryScrollViewtopConstant: CGFloat = 24
    static let leagueSummaryScrollViewHeightConstant: CGFloat = 116
    static let recentGameAnalysisViewHeightConstant: CGFloat = 90
}
