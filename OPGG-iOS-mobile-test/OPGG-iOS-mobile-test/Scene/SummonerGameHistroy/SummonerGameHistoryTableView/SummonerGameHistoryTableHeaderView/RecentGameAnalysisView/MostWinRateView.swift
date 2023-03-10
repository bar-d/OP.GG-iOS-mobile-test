//
//  MostWinRateView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import Kingfisher
import UIKit

final class MostWinRateView: UIView {
    
    // MARK: Properties
    
    private let mostWinRateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.mostWinRateTitleLabelFont
        label.textColor = .coolGrey
        label.text = Design.mostWinRateTitleLabelDefaultText
        
        return label
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = Design.horizontalStackViewSpacing
        
        return stackView
    }()
    
    private let firstChampionVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = Design.verticalStackViewSpacing
        
        return stackView
    }()
    
    private let firstMostChampionImageView = CircleImageView()
    
    private let firstMostChampionWinRateLabel: PercentLabel = {
        let label = PercentLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.firstMostChampionWinRateLabelFont
        label.textColor = .darkGrey
        label.text = Design.firstMostChampionWinRateLabelDefaultText
        
        return label
    }()
    
    private let secondChampionVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = Design.verticalStackViewSpacing
        
        return stackView
    }()
    
    private let secondMostChampionImageView = CircleImageView()
    
    private let secondMostChampionWinRateLabel: PercentLabel = {
        let label = PercentLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.secondMostChampionWinRateLabelFont
        label.textColor = .darkGrey
        label.text = Design.secondMostChampionWinRateLabelDefaultText
        
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
    
    func setupContent(with matches: Matches) {
        let sortedChampion = matches.champions.sorted {
            let firstChampion = Int.winRate(wins: $0.wins, games: $0.games)
            let secondChampion = Int.winRate(wins: $1.wins, games: $1.games)
            
            return firstChampion > secondChampion
        }
        
        checkChampionsCount(with: sortedChampion)
        setupMostChampionImage(with: sortedChampion)
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
        [firstMostChampionImageView, firstMostChampionWinRateLabel]
            .forEach { firstChampionVerticalStackView.addArrangedSubview($0) }
        [secondMostChampionImageView, secondMostChampionWinRateLabel]
            .forEach { secondChampionVerticalStackView.addArrangedSubview($0) }
        [firstChampionVerticalStackView, secondChampionVerticalStackView]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        [mostWinRateTitleLabel, horizontalStackView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupMostWinRateTitleLabelConstraints()
        setupHorizontalStackViewConstraints()
        setupChampionImageViewConstraints()
    }
    
    private func setupMostWinRateTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            mostWinRateTitleLabel.topAnchor.constraint(
                equalTo: topAnchor
            ),
            mostWinRateTitleLabel.centerXAnchor.constraint(
                equalTo: horizontalStackView.centerXAnchor
            )
        ])
    }
    
    private func setupHorizontalStackViewConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            horizontalStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            horizontalStackView.topAnchor.constraint(
                equalTo: mostWinRateTitleLabel.bottomAnchor,
                constant: 8
            )
        ])
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            firstMostChampionImageView.widthAnchor.constraint(
                equalToConstant: Design.championImageViewWidthAndHeightConstant
            ),
            firstMostChampionImageView.heightAnchor.constraint(
                equalToConstant: Design.championImageViewWidthAndHeightConstant
            ),
            secondMostChampionImageView.widthAnchor.constraint(
                equalToConstant: Design.championImageViewWidthAndHeightConstant
            ),
            secondMostChampionImageView.heightAnchor.constraint(
                equalToConstant: Design.championImageViewWidthAndHeightConstant
            )
        ])
    }
    
    private func setupMostChampionImage(
        with champions: [Matches .UsedChampionInformation]
    ) {
        let mostWinRates = [secondMostChampionWinRateLabel, firstMostChampionWinRateLabel]
        let mostChampionImageViews = [secondMostChampionImageView,
                                      firstMostChampionImageView]
        
        for i in 0..<champions.count {
            if i >= 2 {
                return
            } else {
                let mostChampion = champions[i]
                
                mostChampionImageViews[i].kf.indicatorType = .activity
                mostChampionImageViews[i].kf.setImage(
                    with: champions[i].imageURL.customURL
                )
                
                mostWinRates[i].setupPercentText(with: mostChampion)
            }
        }
    }
    
    private func checkChampionsCount(with champions: [Matches.UsedChampionInformation]) {
        if champions.count == 1 {
            secondChampionVerticalStackView.isHidden = true
        } else if champions.isEmpty {
            [firstChampionVerticalStackView, secondChampionVerticalStackView]
                .forEach { $0.isHidden = true }
        } else {
            [firstChampionVerticalStackView, secondChampionVerticalStackView]
                .forEach { $0.isHidden = false }
        }
    }
}

// MARK: - Namespace

private enum Design {
    static let mostWinRateTitleLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoRegular, size: 10)
    static let mostWinRateTitleLabelDefaultText = "????????? ??????"
    static let horizontalStackViewSpacing: CGFloat = 16
    static let verticalStackViewSpacing: CGFloat = 4
    static let firstMostChampionWinRateLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 10)
    static let firstMostChampionWinRateLabelDefaultText = "0%"
    static let secondMostChampionWinRateLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 10)
    static let secondMostChampionWinRateLabelDefaultText = "0%"
    static let RecentTwentyGameAnalysisViewWidthConstant: CGFloat = 134
    static let winLoseCountLabelTopConstant: CGFloat = 8
    static let KDALabelTopConstant: CGFloat = 2
    static let championImageViewWidthAndHeightConstant: CGFloat = 30
}
