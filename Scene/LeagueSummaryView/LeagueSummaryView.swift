//
//  LeagueSummaryView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class LeagueSummaryView: UIView {
    
    // MARK: Properties
    
    private let tierIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "unranked")
        
        return imageView
    }()
    
    private let rankTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .softBlue
        label.font = Design.rankTypeLabelFont
        label.text = "솔로랭크"
        
        return label
    }()
    
    private let tierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.tierLableFont
        label.text = "Unranked"
        
        return label
    }()
    
    private let leaguePointLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.leaguePointLabelFont
        label.text = "0 LP"
        
        return label
    }()
    
    private let winRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .steelGrey
        label.font = Design.winRateLabelFont
        label.text = "0승 0패 (0%)"
        
        return label
    }()
    
    private let indicatorView = IndicatorView()
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayerRounded()
        setupLayerShadow()
    }
    
    private func setupLayerRounded() {
        layer.cornerRadius = Design.cornerRadius
        clipsToBounds = true
    }
    
    private func setupLayerShadow() {
        layer.setupShadow(
            color: .steelGrey,
            alpha: Design.layerAlpha,
            x: Design.layerX,
            y: Design.layerY,
            blur: Design.layerBlur,
            spread: Design.layerSpread
        )
    }
    
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
        [tierIconImageView, rankTypeLabel, tierLabel, leaguePointLabel, winRateLabel,
         indicatorView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupLeagueSummaryViewConstraints()
        setupTierIconImageViewConstraints()
        setupRankTypeLabelConstraints()
        setupTierLabelConstraints()
        setupLeaguePointLabelConstraints()
        setupWinRateLabelConstraints()
        setupIndicatorImageViewConstraints()
    }
    
    private func setupLeagueSummaryViewConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Design.leagueSummaryViewHeight)
        ])
    }
    
    private func setupTierIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            tierIconImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 18
            ),
            tierIconImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -18
            ),
            tierIconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            tierIconImageView.widthAnchor.constraint(
                equalTo: tierIconImageView.heightAnchor
            )
        ])
    }
    
    private func setupRankTypeLabelConstraints() {
        NSLayoutConstraint.activate([
            rankTypeLabel.topAnchor.constraint(
                equalTo: tierIconImageView.topAnchor,
                constant: -2
            ),
            rankTypeLabel.leadingAnchor.constraint(
                equalTo: tierIconImageView.trailingAnchor,
                constant: 8
            )
            
        ])
    }
    
    private func setupTierLabelConstraints() {
        NSLayoutConstraint.activate([
            tierLabel.topAnchor.constraint(
                equalTo: rankTypeLabel.bottomAnchor,
                constant: 1
            ),
            tierLabel.leadingAnchor.constraint(
                equalTo: rankTypeLabel.leadingAnchor
            )
        ])
    }
    
    private func setupLeaguePointLabelConstraints() {
        NSLayoutConstraint.activate([
            leaguePointLabel.topAnchor.constraint(
                equalTo: tierLabel.bottomAnchor,
                constant: 2
            ),
            leaguePointLabel.leadingAnchor.constraint(
                equalTo: rankTypeLabel.leadingAnchor
            )
        ])
    }
    
    private func setupWinRateLabelConstraints() {
        NSLayoutConstraint.activate([
            winRateLabel.topAnchor.constraint(
                equalTo: leaguePointLabel.bottomAnchor,
                constant: 2
            ),
            winRateLabel.leadingAnchor.constraint(
                equalTo: rankTypeLabel.leadingAnchor
            )
        ])
    }
    
    private func setupIndicatorImageViewConstraints() {
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 30
            ),
            indicatorView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -30
            ),
            indicatorView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            indicatorView.centerYAnchor.constraint(
                equalTo: tierIconImageView.centerYAnchor
            ),
            indicatorView.widthAnchor.constraint(
                equalTo: indicatorView.heightAnchor
            )
        ])
    }
}

private enum Design {
    static let rankTypeLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoRegular, size: 12)
    static let tierLableFont: UIFont = .fontWith(type: .SFProTextBold, size: 18)
    static let leaguePointLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let winRateLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 10)
    static let cornerRadius: CGFloat = 4
    static let leagueSummaryViewHeight: CGFloat = 100
    static let layerAlpha: Float = 0.2
    static let layerX: CGFloat = 0
    static let layerY: CGFloat = 4
    static let layerBlur: CGFloat = 6
    static let layerSpread: CGFloat = 0
}
