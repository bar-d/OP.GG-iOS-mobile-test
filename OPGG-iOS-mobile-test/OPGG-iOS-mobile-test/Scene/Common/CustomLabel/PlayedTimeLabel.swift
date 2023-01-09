//
//  PlayedTimeLabel.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import UIKit

final class PlayedTimeLabel: UILabel {
    
    // MARK: - Methods
    
    func setupText(with createdDate: Int) {
        let createdDate = createdDate.timePassedFromNow
        let numberAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.fontWith(type: .SFProTextRegular, size: 12)
        ]
        let stringAttribue: [NSAttributedString.Key: Any] = [
            .font: UIFont.fontWith(type: .appleSDGothicNeoRegular, size: 12)
        ]
        
        var numberString = ""
        var dateTypeLabel = ""
        for i in createdDate {
            if i.isNumber {
                numberString.append(i)
            } else {
                dateTypeLabel.append(i)
            }
        }
        
        let timePlayedText = NSMutableAttributedString(
            string: "\(numberString)",
            attributes: numberAttribute
        )
        let dateTypeText = NSMutableAttributedString(
            string: dateTypeLabel,
            attributes: stringAttribue
        )
        let passedText = NSMutableAttributedString(
            string: " 전",
            attributes: stringAttribue
        )
        
        [dateTypeText, passedText]
            .forEach { timePlayedText.append($0) }
        
        attributedText = timePlayedText
    }
}
