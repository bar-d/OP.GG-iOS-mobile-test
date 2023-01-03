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
        imageView.image = Design.tierIconImageViewDefaultImage
        
        return imageView
    }()
    
    private let rankTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .softBlue
        label.font = Design.rankTypeLabelFont
        
        return label
    }()
    
    private let tierLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.tierLabelFont
        label.text = Design.tierLabelDefaultText
        
        return label
    }()
    
    private let leaguePointLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.leaguePointLabelFont
        label.text = Design.leaguePointLabelDefaultText
        
        return label
    }()
    
    private let winRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .steelGrey
        label.font = Design.winRateLabelFont
        label.text = Design.winRateLabelDefaultText
        
        return label
    }()
    
    private let indicatorView = IndicatorView()
    
    // MARK: - Initializers
    
    init(with type: RankType) {
        super.init(frame: .zero)
        
        setupRankTypeLabel(with: type)
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
            heightAnchor.constraint(
                equalToConstant: Design.leagueSummaryViewHeight
            ),
            widthAnchor.constraint(
                equalToConstant: Design.leagueSummaryViewWidth
            )
        ])
    }
    
    private func setupTierIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            tierIconImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Design.tierIconImageViewTopConstant
            ),
            tierIconImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Design.tierIconImageViewBottomConstant
            ),
            tierIconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Design.tierIconImageViewLeadingConstant
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
                constant: Design.rankTypeLabelTopConstant
            ),
            rankTypeLabel.leadingAnchor.constraint(
                equalTo: tierIconImageView.trailingAnchor,
                constant: Design.rankTypeLabelLeadingConstant
            )
            
        ])
    }
    
    private func setupTierLabelConstraints() {
        NSLayoutConstraint.activate([
            tierLabel.topAnchor.constraint(
                equalTo: rankTypeLabel.bottomAnchor,
                constant: Design.tierLabelTopConstant
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
                constant: Design.leaguePointLabelTopConstant
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
                constant: Design.winRateLabelTopConstant
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
                constant: Design.indicatorViewTopConstant
            ),
            indicatorView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Design.indicatorViewBottomConstant
            ),
            indicatorView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Design.indicatorViewTrailingConstant
            ),
            indicatorView.centerYAnchor.constraint(
                equalTo: tierIconImageView.centerYAnchor
            ),
            indicatorView.widthAnchor.constraint(
                equalTo: indicatorView.heightAnchor
            )
        ])
    }
    
    private func setupRankTypeLabel(with type: RankType) {
        rankTypeLabel.text = type.name
    }
}

private enum Design {
    static let tierIconImageViewDefaultImage = UIImage(named: "unranked")
    static let rankTypeLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoRegular, size: 12)
    static let tierLabelFont: UIFont = .fontWith(type: .SFProTextBold, size: 18)
    static let tierLabelDefaultText = "Unranked"
    static let leaguePointLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let leaguePointLabelDefaultText = "0 LP"
    static let winRateLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 10)
    static let winRateLabelDefaultText = "0승 0패 (0%)"
    static let cornerRadius: CGFloat = 4
    static let leagueSummaryViewHeight: CGFloat = 100
    static let leagueSummaryViewWidth: CGFloat = 272
    static let layerAlpha: Float = 0.2
    static let layerX: CGFloat = 0
    static let layerY: CGFloat = 4
    static let layerBlur: CGFloat = 6
    static let layerSpread: CGFloat = 0
    static let tierIconImageViewTopConstant: CGFloat = 18
    static let tierIconImageViewBottomConstant: CGFloat = -18
    static let tierIconImageViewLeadingConstant: CGFloat = 12
    static let rankTypeLabelTopConstant: CGFloat = -2
    static let rankTypeLabelLeadingConstant: CGFloat = 8
    static let tierLabelTopConstant: CGFloat = 1
    static let leaguePointLabelTopConstant: CGFloat = 2
    static let winRateLabelTopConstant: CGFloat = 8
    static let indicatorViewTopConstant: CGFloat = 30
    static let indicatorViewBottomConstant: CGFloat = -30
    static let indicatorViewTrailingConstant: CGFloat = -16
}
