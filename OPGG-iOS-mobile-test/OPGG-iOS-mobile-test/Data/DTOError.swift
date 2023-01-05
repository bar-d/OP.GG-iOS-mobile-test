//
//  DTOError.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/05.
//

import Foundation

enum DTOError: LocalizedError {
    case invalidTransformation

    var errorDescription: String {
        switch self {
        case .invalidTransformation:
            return "Can not transform Data Transfer Object into Domain Object."
        }
    }
}
