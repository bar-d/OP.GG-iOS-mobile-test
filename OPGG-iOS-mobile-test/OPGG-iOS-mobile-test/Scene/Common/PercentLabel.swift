//
//  PercentLabel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import UIKit

final class PercentLabel: UILabel {
    
    // MARK: - Methods
    
    func setupPercentText(with position: Matches.Position) {
        let wins = Double(position.wins)
        let games = Double(position.games)
        
        let percent = Int(round(wins / games * 100))
        
        var percentAttribute: [NSAttributedString.Key: Any] {
            if percent > 60 {
                return [.foregroundColor: UIColor.darkishPink]
            } else if percent > 30 {
                return [.foregroundColor: UIColor.greenBlue]
            } else {
                return [.foregroundColor: UIColor.darkGrey]
            }
        }
        
        let percentText = NSMutableAttributedString(
            string: "\(percent)%",
            attributes: percentAttribute
        )
        
        attributedText = percentText
    }
    
    func setupPercentText(with champion: Matches.UsedChampionInformation) {
        let wins = Double(champion.wins)
        let games = Double(champion.games)
        
        let percent = Int(round(wins / games * 100))
        
        var percentAttribute: [NSAttributedString.Key: Any] {
            if percent > 60 {
                return [.foregroundColor: UIColor.darkishPink]
            } else if percent > 30 {
                return [.foregroundColor: UIColor.greenBlue]
            } else {
                return [.foregroundColor: UIColor.darkGrey]
            }
        }
        
        let percentText = NSMutableAttributedString(
            string: "\(percent)%",
            attributes: percentAttribute
        )
        
        attributedText = percentText
    }
}

