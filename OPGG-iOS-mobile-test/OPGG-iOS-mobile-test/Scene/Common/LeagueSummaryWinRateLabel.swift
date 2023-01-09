//
//  LeagueSummaryWinRateLabel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import UIKit

final class LeagueSummaryWinRateLabel: UILabel {
    
    // MARK: - Methods
    
    func setupText(wins: Int, losses: Int) {
        let winRate = Int.winRate(wins: wins, losses: losses)
        let numberAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.fontWith(type: .SFProTextRegular, size: 10)
        ]
        let stringAttribue: [NSAttributedString.Key: Any] = [
            .font: UIFont.fontWith(type: .appleSDGothicNeoRegular, size: 10)
        ]
        
        let totalWinText = NSMutableAttributedString(
            string: "\(wins)",
            attributes: numberAttribute
        )
        let winText = NSMutableAttributedString(
            string: "승 ",
            attributes: stringAttribue
        )
        let totalLossesText = NSMutableAttributedString(
            string: "\(losses)",
            attributes: numberAttribute
        )
        let lossText = NSMutableAttributedString(
            string: "패 ",
            attributes: stringAttribue
        )
        let winRateText = NSMutableAttributedString(
            string: "(\(winRate)%)",
            attributes: stringAttribue
        )
        
        [winText, totalLossesText, lossText, winRateText]
            .forEach { totalWinText.append($0) }

        attributedText = totalWinText

    }
}
