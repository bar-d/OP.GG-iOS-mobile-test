//
//  IndicatorView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class IndicatorView: UIView {
    
    // MARK: Properties
    
    private let indicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Design.indicatorImage
        
        return imageView
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayerCircle()
    }
    
    private func setupLayerCircle() {
        layer.cornerRadius = frame.circleRadius
        clipsToBounds = true
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupBackgroundColor(.paleGrey)
        setupSubviews()
        setupIndicatorImageViewConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupSubviews() {
        addSubview(indicatorImageView)
    }
    
    private func setupIndicatorImageViewConstraints() {
        NSLayoutConstraint.activate([
            indicatorImageView.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            indicatorImageView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            indicatorImageView.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: Design.indicatorImageViewHeightMultiplier
            ),
            indicatorImageView.widthAnchor.constraint(
                equalTo: indicatorImageView.heightAnchor
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let indicatorImage = UIImage(named: "iconArrowRight")
    static let indicatorImageViewHeightMultiplier: CGFloat = 0.6
}
