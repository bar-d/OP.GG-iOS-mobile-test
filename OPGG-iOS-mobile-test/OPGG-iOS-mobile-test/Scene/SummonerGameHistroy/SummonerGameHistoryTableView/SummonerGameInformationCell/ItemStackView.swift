//
//  ItemStackView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/04.
//

import Kingfisher
import UIKit

final class ItemStackView: UIStackView {
    
    // MARK: Properties
    
    private let firstItemImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.itemImageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let secondItemImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.itemImageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let thirdItemImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.itemImageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let fourthItemImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.itemImageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let fifthItemImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.itemImageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let sixthItemImageView: UIImageView = {
        let iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.backgroundColor = .paleGrey2
        iamgeView.layer.cornerRadius = Design.itemImageViewCornerRadius
        iamgeView.clipsToBounds = true
        
        return iamgeView
    }()
    
    private let accessoryItemImageView = CircleImageView()
    
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
        [firstItemImageView, secondItemImageView, thirdItemImageView,
         fourthItemImageView, fifthItemImageView, sixthItemImageView]
            .forEach { $0.image = nil }
    }
    
    func setupContent(with game: Matches.Game) {
        let items = [firstItemImageView, secondItemImageView, thirdItemImageView,
                     fourthItemImageView, fifthItemImageView, sixthItemImageView]
        
        for i in 0..<game.items.count - 1 {
            items[i].kf.setImage(with: game.items[i].imageURL)
        }
        
        accessoryItemImageView.kf.setImage(with: game.items.last?.imageURL)
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupAxis(.horizontal)
        setupSpacing(Design.stackViewSpacing)
        setupDistribution(.equalSpacing)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [firstItemImageView, secondItemImageView, thirdItemImageView,
         fourthItemImageView, fifthItemImageView, sixthItemImageView,
         accessoryItemImageView]
            .forEach { addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        setupItemStackViewConstraints()
        setupFirstItemImageViewConstraints()
        setupItemImageViewsConstraints()
    }
    
    private func setupItemStackViewConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(
                equalToConstant: Design.itemStackViewHeightConstant
            )
        ])
    }
    
    private func setupFirstItemImageViewConstraints() {
        NSLayoutConstraint.activate([
            firstItemImageView.heightAnchor.constraint(
                equalTo: heightAnchor
            ),
            firstItemImageView.widthAnchor.constraint(
                equalTo: firstItemImageView.heightAnchor
            )
        ])
    }
    
    private func setupItemImageViewsConstraints() {
        [secondItemImageView, thirdItemImageView, fourthItemImageView,
         fifthItemImageView, sixthItemImageView, accessoryItemImageView]
            .forEach {
                $0.heightAnchor.constraint(
                    equalTo: firstItemImageView.heightAnchor
                ).isActive = true
                $0.widthAnchor.constraint(
                    equalTo: firstItemImageView.widthAnchor
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
    static let itemImageViewCornerRadius: CGFloat = 3
    static let stackViewSpacing: CGFloat = 2
    static let itemStackViewHeightConstant: CGFloat = 24
}
