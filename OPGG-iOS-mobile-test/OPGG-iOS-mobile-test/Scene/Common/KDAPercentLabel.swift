//
//  KDAPercentLabel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import UIKit

final class KDAPercentLabel: UILabel {
    
    // MARK: - Methods
    
    func setupKDAPercentAverage(with summary: Matches.Summary) {
        let kills = Double(summary.kills)
        let deaths = Double(summary.deaths)
        let assists = Double(summary.assists)
        let totalKDA = ((kills + assists) / deaths).withDecimal(decimalPoint: 2)
        let winRate = Int.winRate(wins: summary.wins, losses: summary.losses)
        
        var totalKDAAttribute: [NSAttributedString.Key: Any] {
            guard let totalKDA = Double(totalKDA) else { return [:] }
            
            if totalKDA > 6 {
                return [.foregroundColor: UIColor.darkishPink]
            } else if totalKDA > 3 {
                return [.foregroundColor: UIColor.greenBlue]
            } else {
                return [.foregroundColor: UIColor.charcoalGrey]
            }
        }
        
        var winRateAttribute: [NSAttributedString.Key: Any] {
            if winRate > 60 {
                return [.foregroundColor: UIColor.darkishPink]
            } else if winRate > 30 {
                return [.foregroundColor: UIColor.greenBlue]
            } else {
                return [.foregroundColor: UIColor.charcoalGrey]
            }
        }
        
        let totalKDAText = NSMutableAttributedString(
            string: "\(totalKDA):1 ",
            attributes: totalKDAAttribute
        )
        
        let winRateText = NSMutableAttributedString(
            string: "(\(winRate)%)",
            attributes: winRateAttribute
        )
        
        totalKDAText.append(winRateText)
        attributedText = totalKDAText
    }
}
