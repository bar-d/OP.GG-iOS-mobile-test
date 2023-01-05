//
//  PositionView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class PositionView: UIView {
    
    // MARK: Properties
    
    private let positionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.positionTitleLabelFont
        label.textColor = .coolGrey
        label.text = Design.positionTitleLabelDefaultText
        
        return label
    }()
    
    private let positionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Design.positionImageViewDefaultImage
        
        return imageView
    }()
    
    private let positionRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.positionRateLabelFont
        label.textColor = .darkGrey
        label.text = Design.positionRateLabelDefaultText
        
        return label
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
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
        [positionTitleLabel, positionImageView, positionRateLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupPositioinViewConstraints()
        setupPositionTitleLabelConstraints()
        setupPositionImageViewConstraints()
        setupPositionRateLableConstraints()
    }
    
    private func setupPositioinViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(
                equalToConstant: Design.positionViewWidthConstant
            )
        ])
    }
    
    private func setupPositionTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            positionTitleLabel.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            positionTitleLabel.topAnchor.constraint(
                equalTo: topAnchor
            )
        ])
    }
    
    private func setupPositionImageViewConstraints() {
        NSLayoutConstraint.activate([
            positionImageView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            positionImageView.widthAnchor.constraint(
                equalToConstant: Design.positionImageViewWidthAndHeightConstant
            ),
            positionImageView.heightAnchor.constraint(
                equalToConstant: Design.positionImageViewWidthAndHeightConstant
            ),
            positionImageView.topAnchor.constraint(
                equalTo: positionTitleLabel.bottomAnchor,
                constant: Design.positionImageViewTopConstant
            )
        ])
    }
    
    private func setupPositionRateLableConstraints() {
        NSLayoutConstraint.activate([
            positionRateLabel.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            positionRateLabel.topAnchor.constraint(
                equalTo: positionImageView.bottomAnchor,
                constant: Design.positionRateLabelTopConstant
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let positionTitleLabelFont: UIFont = .fontWith(type: .appleSDGothicNeoRegular, size: 10)
    static let positionTitleLabelDefaultText = "포지션"
    static let positionImageViewDefaultImage = UIImage(named: "iconLolAll")
    static let positionRateLabelFont: UIFont = .fontWith(type: .SFProTextRegular, size: 10)
    static let positionRateLabelDefaultText = "0%"
    static let positionViewWidthConstant: CGFloat = 30
    static let positionImageViewWidthAndHeightConstant: CGFloat = 24
    static let positionImageViewTopConstant: CGFloat = 10
    static let positionRateLabelTopConstant: CGFloat = 8
}
