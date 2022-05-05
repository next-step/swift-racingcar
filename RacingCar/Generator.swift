//
//  Generator.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/05/03.
//

import Foundation

final class Generator {
    
    // MARK: - Method
    static func generateRandomNumber() -> Int {
        return Int.random(in: 0 ... 9)
    }
}
