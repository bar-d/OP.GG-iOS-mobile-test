//
//  RecentTwentyGameAnalysisView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class RecentTwentyGameAnalysisView: UIView {
    
    // MARK: Properties
    
    private let recentTwentyGameAnalysisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .coolGrey
        label.font = .fontWith(type: .SFProTextRegular, size: 10)
        label.text = Design.recentTwentyGameAnalysisLabelDefaultText
        
        return label
    }()
    
    private let winLoseCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .coolGrey
        label.font = .fontWith(type: .SFProTextRegular, size: 10)
        label.text = Design.winLoseCountLabelDefaultText
        
        return label
    }()
    
    private let kdaLabel: KDALabel = {
        let label = KDALabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .charcoalGrey
        label.font = .fontWith(type: .SFProTextBold, size: 14)
        label.text = Design.KDALabelDefaultText
        
        return label
    }()
    
    private let kdaPercentLabel: KDAPercentLabel = {
        let label = KDAPercentLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Design.KDAPercentLabelDefaulText
        label.font = .fontWith(type: .SFProTextRegular, size: 10)
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupContent(with summary: Matches.Summary) {
        let kills = Double(summary.kills)
        let deaths = Double(summary.deaths)
        let assists = Double(summary.assists)
        let totalGameCount = summary.wins + summary.losses
        let totalKDA = ((kills + assists) / deaths).withDecimal(decimalPoint: 2)
        let winRate = Int.winRate(wins: summary.wins, losses: summary.losses)
        
        recentTwentyGameAnalysisLabel.text = "최근 \(totalGameCount)게임 분석"
        winLoseCountLabel.text = "\(summary.wins)승 \(summary.losses)패"
        kdaLabel.setupKDAAverage(with: summary)
        kdaPercentLabel.setupKDAPercentAverage(with: summary)
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
        [recentTwentyGameAnalysisLabel, winLoseCountLabel, kdaLabel, kdaPercentLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupRecentTwentyGameAnalysisViewConstraints()
        setupRecentTwentyGameAnalysisLabelConstraints()
        setupWinLoseCountLabelConstraints()
        setupKDALabelConconstraints()
        setupKDAPercentLabelConstraints()
    }
    
    private func setupRecentTwentyGameAnalysisViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(
                equalToConstant: Design.RecentTwentyGameAnalysisViewWidthConstant
            )
        ])
    }
    
    private func setupRecentTwentyGameAnalysisLabelConstraints() {
        NSLayoutConstraint.activate([
            recentTwentyGameAnalysisLabel.topAnchor.constraint(
                equalTo: topAnchor
            ),
            recentTwentyGameAnalysisLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            )
        ])
    }
    
    private func setupWinLoseCountLabelConstraints() {
        NSLayoutConstraint.activate([
            winLoseCountLabel.topAnchor.constraint(
                equalTo: recentTwentyGameAnalysisLabel.bottomAnchor,
                constant: Design.winLoseCountLabelTopConstant
            ),
            winLoseCountLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            )
        ])
    }
    
    private func setupKDALabelConconstraints() {
        NSLayoutConstraint.activate([
            kdaLabel.topAnchor.constraint(
                equalTo: winLoseCountLabel.bottomAnchor,
                constant: Design.KDALabelTopConstant
            ),
            kdaLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            )
        ])
    }
    
    private func setupKDAPercentLabelConstraints() {
        NSLayoutConstraint.activate([
            kdaPercentLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            kdaPercentLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let recentTwentyGameAnalysisLabelDefaultText = "최근 20게임 분석"
    static let winLoseCountLabelDefaultText = "0승 0패"
    static let KDALabelDefaultText = "0 / 0 / 0"
    static let KDAPercentLabelDefaulText = "0:0 (0%)"
    static let RecentTwentyGameAnalysisViewWidthConstant: CGFloat = 134
    static let winLoseCountLabelTopConstant: CGFloat = 8
    static let KDALabelTopConstant: CGFloat = 2
}
