//
//  OPScoreBadge.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/27.
//

import UIKit.UIColor

enum OPScoreBadge: String {
    case mvp = "MVP"
    case ace = "ACE"
    
    var color: UIColor {
        switch self {
        case .mvp: return .orangeYellow
        case .ace: return .periwinkle
        }
    }
}
