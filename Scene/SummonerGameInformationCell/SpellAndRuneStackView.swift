//
//  SpellAndRuneStackView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import UIKit

final class SpellAndRuneStackView: UIStackView {
    
    // MARK: Properties
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = Design.stackViewSpacing
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private let spellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Design.stackViewSpacing
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private let firstSpellImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.imageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let secondSpellImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.imageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let runeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Design.stackViewSpacing
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private let mainRuneImageView = CircleImageView()
    private let supportRuneImageView = CircleImageView()
    
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
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupAxis(.horizontal)
        setupSpacing(Design.stackViewSpacing)
        setupDistribution(.fillEqually)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [spellStackView, runeStackView]
            .forEach { addArrangedSubview($0) }
        [firstSpellImageView, secondSpellImageView]
            .forEach { spellStackView.addArrangedSubview($0) }
        [mainRuneImageView, supportRuneImageView]
            .forEach { runeStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        setupImageViewConstraints()
    }
    
    private func setupImageViewConstraints() {
        [firstSpellImageView, secondSpellImageView, mainRuneImageView,
         supportRuneImageView]
            .forEach {
                $0.widthAnchor.constraint(
                    equalToConstant: Design.imageViewWidthAndHeightConstant
                ).isActive = true
                $0.heightAnchor.constraint(
                    equalToConstant: Design.imageViewWidthAndHeightConstant
                ).isActive = true
            }
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
    static let stackViewSpacing: CGFloat = 2
    static let imageViewCornerRadius: CGFloat = 4
    static let imageViewWidthAndHeightConstant: CGFloat = 19
}
