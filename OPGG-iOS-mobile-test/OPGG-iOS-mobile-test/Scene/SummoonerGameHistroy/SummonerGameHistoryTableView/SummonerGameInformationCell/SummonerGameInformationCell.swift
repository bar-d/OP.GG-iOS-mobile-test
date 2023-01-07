//
//  SummonerGameInformationCell.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class SummonerGameInformationCell: UITableViewCell {
    
    // MARK: Properties
    
    private let gameResultView = GameReultView()
    private let championImageView = CircleImageView()
    
    private let bestPlayerBadge: PaddingLabel = {
        let label = PaddingLabel(
            top: Design.bestPlayerBadgeTopBottomPadding,
            left: Design.bestPlayerBadgeLeftRightPadding,
            bottom: Design.bestPlayerBadgeTopBottomPadding,
            right: Design.bestPlayerBadgeLeftRightPadding
        )
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Design.bestPlayerBadgeFont
        label.layer.cornerRadius = Design.bestPlayerBadgeCornerRadius
        label.layer.borderWidth = Design.bestPlayerBadgBorderWidth
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.masksToBounds = true
        label.isHidden = true
        
        return label
    }()
    
    private let spellAndRuneStackView = SpellAndRuneStackView()
    private let kdaStackView = KDAStackView()
    private let itemStackView = ItemStackView()
    private let additionalInformationView = AdditionalInformationView()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupContent(with game: Matches.Game) {
        setupSummonerGameInformationCell(with: game)
        gameResultView.setupContentWith(game: game)
        spellAndRuneStackView.setupContent(with: game)
        kdaStackView.setupContent(with: game)
        itemStackView.setupContent(with: game)
        additionalInformationView.setupContent(with: game)
    }
    
    func setupSummonerGameInformationCell(with game: Matches.Game) {
        championImageView.kf.setImage(with: game.champion.iamgeURL)
        bestPlayerBadge.text = game.stats.general.opScoreBadge
        bestPlayerBadge.backgroundColor = game.isWin ? .orangeYellow : .periwinkle
        bestPlayerBadge.isHidden = bestPlayerBadge.text == "" ? true : false
    }
    
    private func commonInit() {
        setupBackgroundColor(.white)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupSubviews() {
        [gameResultView, championImageView, bestPlayerBadge, spellAndRuneStackView,
         kdaStackView, itemStackView, additionalInformationView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupGameResultViewConstraints()
        setupChampionImageViewConstraints()
        setupBestPlayerBadgeConstraints()
        setupSpellAndRuneStackViewConstraints()
        setupKDAStackViewConstraints()
        setupItemStackViewConstraints()
        setupAdditionalInformationViewConstraints()
    }
    
    private func setupGameResultViewConstraints() {
        NSLayoutConstraint.activate([
            gameResultView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            gameResultView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Design.championImageViewTopAndLeadingConstant
            ),
            championImageView.leadingAnchor.constraint(
                equalTo: gameResultView.trailingAnchor,
                constant: Design.championImageViewTopAndLeadingConstant
            ),
            championImageView.heightAnchor.constraint(
                equalToConstant: Design.championImageViewWidthAndHeightConstant
            ),
            championImageView.widthAnchor.constraint(
                equalToConstant: Design.championImageViewWidthAndHeightConstant
            )
        ])
    }
    
    private func setupBestPlayerBadgeConstraints() {
        NSLayoutConstraint.activate([
            bestPlayerBadge.centerXAnchor.constraint(
                equalTo: championImageView.centerXAnchor
            ),
            bestPlayerBadge.centerYAnchor.constraint(
                equalTo: championImageView.bottomAnchor
            )
        ])
    }
    
    private func setupSpellAndRuneStackViewConstraints() {
        NSLayoutConstraint.activate([
            spellAndRuneStackView.topAnchor.constraint(
                equalTo: championImageView.topAnchor
            ),
            spellAndRuneStackView.leadingAnchor.constraint(
                equalTo: championImageView.trailingAnchor,
                constant: Design.spellAndRuneStackViewLeadingConstant
            )
        ])
    }
    
    private func setupKDAStackViewConstraints() {
        NSLayoutConstraint.activate([
            kdaStackView.topAnchor.constraint(
                equalTo: championImageView.topAnchor,
                constant: Design.kdaStackViewTopConstant
            ),
            kdaStackView.leadingAnchor.constraint(
                equalTo: spellAndRuneStackView.trailingAnchor,
                constant: Design.kdaStackViewLeadingConstant
            )
        ])
    }
    
    private func setupItemStackViewConstraints() {
        NSLayoutConstraint.activate([
            itemStackView.topAnchor.constraint(
                equalTo: championImageView.bottomAnchor,
                constant: Design.itemStackViewTopConstant
            ),
            itemStackView.leadingAnchor.constraint(
                equalTo: gameResultView.trailingAnchor,
                constant: Design.itemStackViewLeadingConstant
            )
        ])
    }
    
    private func setupAdditionalInformationViewConstraints() {
        NSLayoutConstraint.activate([
            additionalInformationView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            additionalInformationView.leadingAnchor.constraint(
                equalTo: itemStackView.trailingAnchor
            ),
            additionalInformationView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            additionalInformationView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let bestPlayerBadgeTopBottomPadding: CGFloat = 2
    static let bestPlayerBadgeLeftRightPadding: CGFloat = 4
    static let bestPlayerBadgeFont: UIFont = .fontWith(type: .SFProTextBold, size: 10)
    static let bestPlayerBadgeCornerRadius: CGFloat = 8
    static let bestPlayerBadgBorderWidth: CGFloat = 1
    static let championImageViewTopAndLeadingConstant: CGFloat = 16
    static let championImageViewWidthAndHeightConstant: CGFloat = 40
    static let spellAndRuneStackViewLeadingConstant: CGFloat = 16
    static let kdaStackViewTopConstant: CGFloat = 2
    static let kdaStackViewLeadingConstant: CGFloat = 8
    static let itemStackViewTopConstant: CGFloat = 8
    static let itemStackViewLeadingConstant: CGFloat = 16
}
