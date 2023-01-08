//
//  Int+Extension.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

import Foundation.NSDate

extension Int {
    var convertToGameLength: String {
        let dateComponents = DateComponents(second: self)
        guard let date = Calendar.current.date(from: dateComponents) else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        
        return formatter.string(from: date)
    }
    
    var timePassedFromNow: String {
        let timeInterval = TimeInterval(Double(self))
        let playedDate = Date(timeIntervalSince1970: timeInterval)
        let dateComponents = Calendar.current.dateComponents(
            [.second, .minute, .hour, .day, .weekOfMonth],
            from: playedDate, to: Date()
        )
        
        if let month = dateComponents.month {
            if month > 0 {
                return "\(month)달 전"
            }
        }
        
        if let day = dateComponents.day {
            if day > 0 {
                return "\(day)일 전"
            }
        }
        
        if let hour = dateComponents.hour {
            if hour > 0 {
                return "\(hour)시간 전"
            }
        }
        
        if let minute = dateComponents.minute {
            if minute > 0 {
                return "\(minute)분 전"
            }
        }
        
        if let second = dateComponents.second {
            return "\(second)초 전"
        }
        
        return ""
    }
    
    static func winRate(wins: Int, games: Int) -> Self {
        
        return Int(round(Double(wins) / Double(games) * 100))
    }
    
    static func winRate(wins: Int, losses: Int) -> Self {
        
        return Int(round(Double(wins) / Double(wins + losses) * 100))
    }
}
