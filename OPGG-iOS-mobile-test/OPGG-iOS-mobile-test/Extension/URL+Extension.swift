//
//  URL+Extension.swift
//  OPGG-iOS-mobile-test
//
//  Created by bard on 2023/01/16.
//

import Foundation

extension URL {
    var customURL: URL {
        var stringedURL = ""
        
        if !absoluteString.contains("https:") {
            stringedURL.append("https:")
            stringedURL.append(absoluteString)
        } else if absoluteString.contains("///") {
            stringedURL = absoluteString.replacingOccurrences(of: "///", with: "//")
        } else {
            return self
        }
        
        guard let url = URL(string: stringedURL) else {
            return self
        }
        
        return url
    }
}
