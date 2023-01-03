//
//  TopView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class TopView: UIView {
    
    // MARK: Properties
    
    private let iconImageView = CircleImageView()
    
    private let summonerLevelLabel: PaddingLabel = {
        let label = PaddingLabel(top: 5, left: 8, bottom: 5, right: 8)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .darkGrey
        label.textColor = .white
        label.font = Design.summonerLevelLabelFont
        label.layer.cornerRadius = Design.summonerLevelLabelCornerRadius
        label.clipsToBounds = true
        label.text = "247"
        
        return label
    }()
    
    private let summonerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.summonerNameLabelFont
        label.text = "OPGG"
        
        return label
    }()
    
    private let refreshGameHistoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .softBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Design.refreshGameHistoryButtonFont
        button.setTitle(Design.refreshGameHistoryButtonTitle, for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        setNeedsLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupIconImage(_ image: UIImage?) {
        iconImageView.image = image
    }
    
    func setupSummonerLevelLabelText(_ text: String?) {
        guard let unwrappedText = text else { return }
        
        if unwrappedText.count == 1 {
            summonerLevelLabel.text = " \(unwrappedText) "
        } else {
            summonerLevelLabel.text = unwrappedText.numberFormatted
        }
    }
    
    func addRefreshGameHistoryButtonTarget(
        target: Any?,
        action: Selector,
        for event: UIControl.Event
    ) {
        refreshGameHistoryButton.addTarget(target, action: action, for: event)
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
            heightAnchor.constraint(equalToConstant: 88)
        ])
    }
    
    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            iconImageView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            iconImageView.widthAnchor.constraint(
                equalToConstant: 88
            ),
            iconImageView.heightAnchor.constraint(
                equalToConstant: 88
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
                constant: 16
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
                equalToConstant: 97
            ),
            refreshGameHistoryButton.heightAnchor.constraint(
                equalToConstant: 40
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let summonerLevelLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let summonerLevelLabelCornerRadius: CGFloat = 12
    static let summonerNameLabelFont: UIFont = .fontWith(type: .SFProTextBold, size: 24)
    static let refreshGameHistoryButtonFont: UIFont = .fontWith(type: .SFProTextRegular, size: 14)
    static let refreshGameHistoryButtonTitle = "전적갱신"
}
