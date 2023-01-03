//
//  CircleImageView.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit

final class CircleImageView: UIImageView {
    
    // MARK: - Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
