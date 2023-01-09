//
//  RecentTwentyGameAnalysisLabel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import UIKit

final class RecentTwentyGameAnalysisLabel: UILabel {
    
    // MARK: - Methods
    
    func setupText(gameCount: Int) {
        let numberAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.fontWith(type: .SFProTextRegular, size: 10)
        ]
        let stringAttribue: [NSAttributedString.Key: Any] = [
            .font: UIFont.fontWith(type: .appleSDGothicNeoRegular, size: 10)
        ]

        let recentText = NSMutableAttributedString(
            string: "최근 ",
            attributes: stringAttribue
        )
        let totalGameText = NSMutableAttributedString(
            string: "\(gameCount)",
            attributes: numberAttribute
        )
        let analysisText = NSMutableAttributedString(
            string: "패 ",
            attributes: stringAttribue
        )
        
        [totalGameText, analysisText]
            .forEach { recentText.append($0) }

        attributedText = recentText
    }
}
