//
//  String+Extension.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/03.
//

import Foundation

extension String {
    var decimalNumberFormatted: String {
        guard let inputString = Int(self) else {
            return ""
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: inputString) ?? self
    }
    
    var firstLetterUppercased: String {
        guard let firstCharacter = self.first else {
            return ""
        }

        let firstLetter = String(firstCharacter).uppercased()
        let restLetter = self.dropFirst().lowercased()

        return firstLetter + restLetter
    }
    
    static func kdaAverage(with summary: Matches.Summary) -> String {
        let kills = Double(summary.kills)
        let deaths = Double(summary.deaths)
        let assists = Double(summary.assists)
        let totalGameCount = Double(summary.wins + summary.losses)
        let totalKills = (kills / totalGameCount).withDecimal(decimalPoint: 1)
        let totalDeaths = (deaths / totalGameCount).withDecimal(decimalPoint: 1)
        let totalAssists = (assists / totalGameCount).withDecimal(decimalPoint: 1)
        
        return "\(totalKills) / \(totalDeaths) / \(totalAssists)"
    }
}
