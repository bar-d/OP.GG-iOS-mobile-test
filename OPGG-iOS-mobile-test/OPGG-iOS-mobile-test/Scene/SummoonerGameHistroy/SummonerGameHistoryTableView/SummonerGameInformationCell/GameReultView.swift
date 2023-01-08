//
//  GameReultView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class GameReultView: UIView {
    
    // MARK: Properties
    
    private let gameResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.gameResultLabelFont
        label.textColor = .white
        label.text = "무"
        
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private let gameDurationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0:00"
        label.font = Design.gameDurationLabelFont
        label.textColor = .white
        
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
    
    func setupContentWith(game: Matches.Game) {
        gameResultLabel.text = game.isWin ? "승" : "패"
        gameDurationLabel.text = game.gameLength.convertToGameLength
        setupBackgroundColor(game.isWin ? .softBlue : .darkishPink)
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupBackgroundColor(.charcoalGrey)
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
        [gameResultLabel, separatorView, gameDurationLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupGameReultViewConstraints()
        setupGameResultLabelConstraints()
        setupSeparatorViewConstraints()
        setupGameDurationlabelConstraints()
    }
    
    private func setupGameReultViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(
                equalToConstant: Design.gameReultViewWidthConstant
            ),
            heightAnchor.constraint(
                equalToConstant: Design.gameReultViewHeightConstant
            )
        ])
    }
    
    private func setupGameResultLabelConstraints() {
        NSLayoutConstraint.activate([
            gameResultLabel.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            gameResultLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Design.gameResultLabelTopConstant
            )
        ])
    }
    
    private func setupSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            separatorView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            separatorView.heightAnchor.constraint(
                equalToConstant: Design.separatorViewHeightConstant
            ),
            separatorView.widthAnchor.constraint(
                equalToConstant: Design.separatorViewWidthConstant
            ),
            separatorView.topAnchor.constraint(
                equalTo: gameResultLabel.bottomAnchor,
                constant: Design.separatorViewTopConstant
            )
        ])
    }
    
    private func setupGameDurationlabelConstraints() {
        NSLayoutConstraint.activate([
            gameDurationLabel.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            gameDurationLabel.topAnchor.constraint(
                equalTo: separatorView.bottomAnchor,
                constant: Design.gameDurationLabelTopConstant
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let gameResultLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoBold, size: 16)
    static let gameDurationLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 12)
    static let gameReultViewWidthConstant: CGFloat = 40
    static let gameReultViewHeightConstant: CGFloat = 104
    static let gameResultLabelTopConstant: CGFloat = 29
    static let separatorViewHeightConstant: CGFloat = 1
    static let separatorViewWidthConstant: CGFloat = 16
    static let separatorViewTopConstant: CGFloat = 6
    static let gameDurationLabelTopConstant: CGFloat = 6
}
