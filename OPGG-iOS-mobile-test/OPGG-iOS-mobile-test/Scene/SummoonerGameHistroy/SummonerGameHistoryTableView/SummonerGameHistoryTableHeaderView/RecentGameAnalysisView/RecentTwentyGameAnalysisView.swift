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
    
    private let KDALabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .coolGrey
        label.font = .fontWith(type: .SFProTextBold, size: 14)
        label.text = Design.KDALabelDefaultText
        
        return label
    }()
    
    private let KDAPercentLabel: UILabel = {
        let label = UILabel()
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
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [recentTwentyGameAnalysisLabel, winLoseCountLabel, KDALabel, KDAPercentLabel]
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
            KDALabel.topAnchor.constraint(
                equalTo: winLoseCountLabel.bottomAnchor,
                constant: Design.KDALabelTopConstant
            ),
            KDALabel.leadingAnchor.constraint(
                equalTo: leadingAnchor
            )
        ])
    }
    
    private func setupKDAPercentLabelConstraints() {
        NSLayoutConstraint.activate([
            KDAPercentLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            KDAPercentLabel.leadingAnchor.constraint(
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
