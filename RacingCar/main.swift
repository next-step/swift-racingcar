//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

final class StringControl {
    static func split(string: String, separator: Character) -> [String] {
        return string.split(separator: separator).map { String($0) }
    }
        
    static func removeParentheses(_ string: String) -> String {
        return string.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
}
