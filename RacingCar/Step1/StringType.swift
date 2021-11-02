//
//  StringType.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/26.
//

import Foundation

struct StringType {
    
    func firstStringTypeCase(_ testValue: String) -> [String.SubSequence] {
        return testValue.split(separator: ",")
    }
    
    func secondStringTypeCase(_ testValue: String) -> String {
        return testValue
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
    
}
