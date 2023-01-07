//
//  Double+Extension.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/07.
//

extension Double {
    var withOneDecimal: String {
        
        return String(format: "%.1f", self)
    }
    
    func withDecimal(decimalPoint: Int) -> String {
        
        return String(format: "%.\(decimalPoint)f", self)
    }
}
