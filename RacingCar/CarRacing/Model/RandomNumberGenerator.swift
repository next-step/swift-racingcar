//
//  RandomNumberGenerator.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/23.
//

import Foundation

struct RandomNumberGenerator: NumberGeneratable {
    private let randomRange: ClosedRange<Int>
    
    func generate() -> Int {
        return Int.random(in: randomRange)
    }
}
