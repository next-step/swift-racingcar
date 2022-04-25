//
//  StringCaculator.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/25.
//

import Foundation


class StringCaculator {
    
    func splitString(to string: String, separator: Character) -> [String] {
        return string
                .components(separatedBy: ["(", ")"])
                .joined()
                .split(separator: separator).map { String($0)}
    }
}



