//
//  KDAStackView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class KDAStackView: UIStackView {
    
    // MARK: Properties
    
    private let kdaLabel: KDALabel = {
        let label = KDALabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGrey
        label.font = Design.kdaLabelFont
        label.text = Design.kdaLabelDefaultText
        
        return label
    }()
    
    private let killContributionRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gunmetal
        label.font = Design.kdaPercentLabelFont
        label.text = Design.killContributionRateLabelText
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func prepareForReuse() {
        [kdaLabel, killContributionRateLabel]
            .forEach { $0.text = nil }
    }
    
    func setupContent(with game: Matches.Game) {
        let killRate = game.stats.general.contributionForKillRate
        
        kdaLabel.setupKDA(with: game)
        killContributionRateLabel.text = "킬관여 \(killRate)"
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupAxis(.vertical)
        setupSpacing(Design.stackViewSpacing)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [kdaLabel, killContributionRateLabel]
            .forEach { addArrangedSubview($0) }
    }
    
    private func setupAxis(_ axis: NSLayoutConstraint.Axis) {
        self.axis = axis
    }
    
    private func setupSpacing(_ spacing: CGFloat) {
        self.spacing = spacing
    }
    
    private func setupDistribution(_ distribution: Distribution) {
        self.distribution = distribution
    }
}

// MARK: - Namespace

private enum Design {
    static let kdaLabelDefaultText = "0 / 0 / 0"
    static let kdaLabelFont: UIFont = .fontWith(type: .SFProTextBold, size: 16)
    static let killContributionRateLabelText = "킬관여 0%"
    static let kdaPercentLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let stackViewSpacing: CGFloat = 2
}
