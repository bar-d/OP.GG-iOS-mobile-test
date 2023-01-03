//
//  RecentGameAnalysisView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class RecentGameAnalysisView: UIView {
    
    // MARK: Properties
    
    private let recentTwentyGameAnalysisView = RecentTwentyGameAnalysisView()
    private let mostWinRateView = MostWinRateView()
    private let positionView = PositionView()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupBackgroundColor(.white)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupSubviews() {
        [recentTwentyGameAnalysisView, mostWinRateView, positionView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupRecentTwentyGameAnalysisViewConstraints()
        setupMostWinRateViewConstraints()
        setupPositionViewConstraints()
    }
    
    private func setupRecentTwentyGameAnalysisViewConstraints() {
        NSLayoutConstraint.activate([
            recentTwentyGameAnalysisView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Design.recentTwentyGameAnalysisViewTopAndLeadingConstant
            ),
            recentTwentyGameAnalysisView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Design.recentTwentyGameAnalysisViewTopAndLeadingConstant
            ),
            recentTwentyGameAnalysisView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Design.recentTwentyGameAnalysisViewBottomConstant
            )
        ])
    }
    
    private func setupMostWinRateViewConstraints() {
        NSLayoutConstraint.activate([
            mostWinRateView.topAnchor.constraint(
                equalTo: recentTwentyGameAnalysisView.topAnchor
            ),
            mostWinRateView.bottomAnchor.constraint(
                equalTo: recentTwentyGameAnalysisView.bottomAnchor
            ),
            mostWinRateView.trailingAnchor.constraint(
                equalTo: positionView.leadingAnchor,
                constant: Design.mostWinRateViewTrailingConstant
            )
        ])
    }
    
    private func setupPositionViewConstraints() {
        NSLayoutConstraint.activate([
            positionView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Design.positionViewTrailingConstant
            ),
            positionView.topAnchor.constraint(
                equalTo: recentTwentyGameAnalysisView.topAnchor
            ),
            positionView.bottomAnchor.constraint(
                equalTo: recentTwentyGameAnalysisView.bottomAnchor
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let recentTwentyGameAnalysisViewTopAndLeadingConstant: CGFloat = 12
    static let recentTwentyGameAnalysisViewBottomConstant: CGFloat = -12
    static let mostWinRateViewTrailingConstant: CGFloat = -28
    static let positionViewTrailingConstant: CGFloat = -29
}
