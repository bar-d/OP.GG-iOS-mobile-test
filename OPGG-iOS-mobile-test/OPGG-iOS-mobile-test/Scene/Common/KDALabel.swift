//
//  KDALabel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/08.
//

import UIKit

final class KDALabel: UILabel {
    
    // MARK: - Methods
    
    func setupKDAAverage(with summary: Matches.Summary) {
        let kills = Double(summary.kills)
        let deaths = Double(summary.deaths)
        let assists = Double(summary.assists)
        let totalGameCount = Double(summary.wins + summary.losses)
        let totalKills = (kills / totalGameCount).withDecimal(decimalPoint: 1)
        let totalDeaths = (deaths / totalGameCount).withDecimal(decimalPoint: 1)
        let totalAssists = (assists / totalGameCount).withDecimal(decimalPoint: 1)

        let totalDeathsAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkishPink
        ]
        
        let separatedText = NSMutableAttributedString(string: " / ")
        let totalKillsText = NSMutableAttributedString(string: "\(totalKills)")
        let totalDeathText = NSMutableAttributedString(
            string: "\(totalDeaths)",
            attributes: totalDeathsAttribute
        )
        let totalAssistsText = NSMutableAttributedString(string: "\(totalAssists)")
        
        [separatedText, totalDeathText, separatedText, totalAssistsText]
            .forEach { totalKillsText.append($0) }
        
        attributedText = totalKillsText
    }
    
    func setupKDA(with games: Matches.Game) {
        let kills = games.stats.general.kill
        let deaths = games.stats.general.death
        let assists = games.stats.general.assist
        
        let deathsAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkishPink
        ]
        
        let separatedText = NSMutableAttributedString(string: " / ")
        let totalKillsText = NSMutableAttributedString(string: "\(kills)")
        let totalDeathText = NSMutableAttributedString(
            string: "\(deaths)",
            attributes: deathsAttribute
        )
        let totalAssistsText = NSMutableAttributedString(string: "\(assists)")
        
        [separatedText, totalDeathText, separatedText, totalAssistsText]
            .forEach { totalKillsText.append($0) }
        
        attributedText = totalKillsText
    }
}
