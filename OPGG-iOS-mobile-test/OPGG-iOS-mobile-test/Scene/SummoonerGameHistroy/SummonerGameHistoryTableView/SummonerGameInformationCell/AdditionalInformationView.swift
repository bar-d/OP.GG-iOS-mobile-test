//
//  AdditionalInformationView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class AdditionalInformationView: UIView {
    
    // MARK: Properties
    
    private let gameTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .coolGrey
        label.textAlignment = .right
        label.font = Design.gameTypeLabelFont
        return label
    }()
    
    private let playedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .coolGrey
        label.textAlignment = .right
        label.font = Design.playedTimeLabelFont
        return label
    }()
    
    private let killingSpreeLabel: PaddingLabel = {
        let label = PaddingLabel(
            top: Design.killingSpreeTopPadding,
            left: Design.killingSpreeLeftRightPadding,
            bottom: Design.killingSpreeBottomPadding,
            right: Design.killingSpreeLeftRightPadding
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkishPink
        label.font = Design.killingSpreeLabelFont
        label.layer.cornerRadius = Design.killingSpreeLabelCornerRadius
        label.layer.borderColor = UIColor.darkishPink.cgColor
        label.layer.borderWidth = Design.killingSpreeLabelBorderWidth
        label.layer.masksToBounds = true
        label.isHidden = true
        
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
    
    func prepareForReuse() {
        [gameTypeLabel, playedTimeLabel, killingSpreeLabel]
            .forEach { $0.text = nil }
    }
    
    func setupContent(with game: Matches.Game) {
        gameTypeLabel.text = game.gameType
        playedTimeLabel.text = game.createDate.timePassedFromNow
        killingSpreeLabel.text = KillingSpreeType.killingSpree(
            type: game.stats.general.largestMultiKillString
        ).value
        killingSpreeLabel.isHidden = game.stats.general.largestMultiKillString == ""
        ? true : false
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
        [gameTypeLabel, playedTimeLabel, killingSpreeLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupGameTypelabelConstraints()
        setupPlayedTimeLabelConstraints()
        setupKillingSpreeLabelConstraints()
    }
    
    private func setupGameTypelabelConstraints() {
        NSLayoutConstraint.activate([
            gameTypeLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Design.gameTypeLabelTopConstant
            ),
            gameTypeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Design.gameTypeLabelTrailingConstant
            )
        ])
    }
    
    private func setupPlayedTimeLabelConstraints() {
        NSLayoutConstraint.activate([
            playedTimeLabel.topAnchor.constraint(
                equalTo: gameTypeLabel.bottomAnchor,
                constant: Design.playedTimeLabelTopConstant
            ),
            playedTimeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Design.playedTimeLabelTrailingConstant
            )
        ])
    }
    
    private func setupKillingSpreeLabelConstraints() {
        NSLayoutConstraint.activate([
            killingSpreeLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Design.killingSpreeLabelBottomConstant
            ),
            killingSpreeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Design.killingSpreeLabelTrailingConstant
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let gameTypeLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoRegular, size: 12)
    static let playedTimeLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let killingSpreeTopPadding: CGFloat = 4
    static let killingSpreeBottomPadding: CGFloat = 3
    static let killingSpreeLeftRightPadding: CGFloat = 8
    static let killingSpreeLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoRegular, size: 10)
    static let killingSpreeLabelCornerRadius: CGFloat = 9
    static let killingSpreeLabelBorderWidth: CGFloat = 1
    static let gameTypeLabelTopConstant: CGFloat = 16
    static let gameTypeLabelTrailingConstant: CGFloat = -16
    static let playedTimeLabelTopConstant: CGFloat = 1
    static let playedTimeLabelTrailingConstant: CGFloat = -16
    static let killingSpreeLabelBottomConstant: CGFloat = -18
    static let killingSpreeLabelTrailingConstant: CGFloat = -16
}
