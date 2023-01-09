//
//  KillingSpreeType.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/09.
//

enum KillingSpreeType {
    case killingSpree(type: String)
    
    var value: String {
        switch self {
        case .killingSpree(let type):
            if type == "Double Kill" {
                return "더블 킬"
            }
            
            if type == "Triple Kill" {
                return "트리플 킬"
            }
            
            if type == "Quadra Kill" {
                return "쿼드라 킬"
            }
            
            if type == "Penta Kill" {
                return "펜타 킬"
            }
            
            return type
        }
    }
}

