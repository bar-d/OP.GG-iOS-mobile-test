//
//  UIFont+Extension.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import UIKit.UIFont

enum FontType {
    case appleSDGothicNeoRegular
    case appleSDGothicNeoBold
    case SFProTextRegular
    case SFProTextBold
}

extension UIFont {
    static func fontWith(type: FontType, size: CGFloat) -> UIFont {
        var fontName: String {
            switch type {
            case .appleSDGothicNeoRegular:
                return "AppleSDGothicNeo-Regular"
            case .appleSDGothicNeoBold:
                return "AppleSDGothicNeo-Bold"
            case .SFProTextRegular:
                return "SFProText-Regular"
            case .SFProTextBold:
                return "SFProText-Bold"
            }
        }
        
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
