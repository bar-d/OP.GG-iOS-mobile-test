//
//  TopView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import Kingfisher
import RxCocoa
import RxSwift
import UIKit

final class TopView: UIView {
    
    // MARK: Properties
    
    private let iconImageView: CircleImageView = {
        let circleImageView = CircleImageView()
        circleImageView.image = Design.iconImage
        
        return circleImageView
    }()
    
    private let summonerLevelLabel: PaddingLabel = {
        let label = Design.summonerLevelPaddingLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .darkGrey
        label.alpha = Design.summonerLevelPaddingLabelAlpha
        label.textColor = .white
        label.font = Design.summonerLevelLabelFont
        label.layer.cornerRadius = Design.summonerLevelLabelCornerRadius
        label.clipsToBounds = true
        label.text = Design.summonerLevelLabelDefaultText
        
        return label
    }()
    
    private let summonerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.summonerNameLabelFont
        label.text = Design.summonerNameLabelDefaultText
        
        return label
    }()
    
    private let refreshGameHistoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .softBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Design.refreshGameHistoryButtonFont
        button.setTitle(Design.refreshGameHistoryButtonTitle, for: .normal)
        button.layer.cornerRadius = Design.refreshGameHistoryButtonCornerRadius
        button.clipsToBounds = true
        
        return button
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
    
    func getRefreshGameHistoryButton() -> UIButton {
        return refreshGameHistoryButton
    }
    
    func setupContent(with summoner: Summoner) {
        iconImageView.kf.setImage(with: summoner.profileImageURL)
        summonerNameLabel.text = summoner.name
        summonerLevelLabel.text = String(summoner.level)
    }
    
    func setupSummonerLevelLabelText(_ text: String?) {
        guard let unwrappedText = text else { return }
        
        if unwrappedText.count == Design.one {
            summonerLevelLabel.text = " \(unwrappedText) "
        } else {
            summonerLevelLabel.text = unwrappedText.decimalNumberFormatted
        }
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
        [iconImageView, summonerLevelLabel, summonerNameLabel, refreshGameHistoryButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTopViewConstraints()
        setupIconImageViewConstraints()
        setupLevelLabelConstraints()
        setupSummoonerNameLabelConstraints()
        setupRefreshGameHistoryButtonConstraints()
    }
    
    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(
                equalToConstant: Design.topViewHeight
            )
        ])
    }
    
    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Design.leadingAndTrailingSpacing
            ),
            iconImageView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            iconImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor
            ),
            iconImageView.heightAnchor.constraint(
                equalTo: iconImageView.widthAnchor
            )
        ])
    }
    
    private func setupLevelLabelConstraints() {
        NSLayoutConstraint.activate([
            summonerLevelLabel.trailingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor
            ),
            summonerLevelLabel.bottomAnchor.constraint(
                equalTo: iconImageView.bottomAnchor
            )
        ])
    }
    
    private func setupSummoonerNameLabelConstraints() {
        NSLayoutConstraint.activate([
            summonerNameLabel.topAnchor.constraint(
                equalTo: iconImageView.topAnchor
            ),
            summonerNameLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: Design.leadingAndTrailingSpacing
            )
        ])
    }
    
    private func setupRefreshGameHistoryButtonConstraints() {
        NSLayoutConstraint.activate([
            refreshGameHistoryButton.leadingAnchor.constraint(
                equalTo: summonerNameLabel.leadingAnchor
            ),
            refreshGameHistoryButton.bottomAnchor.constraint(
                equalTo: iconImageView.bottomAnchor
            ),
            refreshGameHistoryButton.widthAnchor.constraint(
                equalToConstant: Design.refreshGameHistoryButtonWidth
            ),
            refreshGameHistoryButton.heightAnchor.constraint(
                equalToConstant: Design.refreshGameHistoryButtonHeight
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let iconImage = UIImage(named: "defaultIcon")
    static let summonerLevelPaddingLabel = PaddingLabel(top: 5, left: 8, bottom: 5, right: 8)
    static let summonerLevelPaddingLabelAlpha:CGFloat = 0.9
    static let summonerLevelLabelDefaultText = " 0 "
    static let summonerLevelLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let summonerLevelLabelCornerRadius: CGFloat = 12
    static let summonerNameLabelDefaultText = "OPGG"
    static let summonerNameLabelFont: UIFont = .fontWith(type: .SFProTextBold, size: 24)
    static let refreshGameHistoryButtonFont: UIFont = .fontWith(type: .SFProTextRegular, size: 14)
    static let refreshGameHistoryButtonTitle = "전적갱신"
    static let refreshGameHistoryButtonCornerRadius: CGFloat = 20
    static let one = 1
    static let topViewHeight: CGFloat = 88
    static let leadingAndTrailingSpacing: CGFloat = 16
    static let refreshGameHistoryButtonWidth: CGFloat = 97
    static let refreshGameHistoryButtonHeight: CGFloat = 40
}
