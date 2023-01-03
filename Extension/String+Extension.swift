//
//  String+Extension.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import Foundation

extension String {
    var numberFormatted: String {
        guard let inputString = Int(self) else { return "" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: inputString) ?? self
    }
}
