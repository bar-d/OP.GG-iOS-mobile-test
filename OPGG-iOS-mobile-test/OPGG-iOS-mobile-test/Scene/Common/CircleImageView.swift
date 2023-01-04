//
//  CircleImageView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class CircleImageView: UIImageView {
    
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
        setupBackgroundColor(.paleGrey2)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
}
