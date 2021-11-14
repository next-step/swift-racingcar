//
//  NumberGenerator.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

struct NumberGenerator: RandomNumberGenerator {
    
    private let minValue: UInt64
    private let maxValue: UInt64
    
    init(minValue: UInt64, maxValue: UInt64) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    func next() -> UInt64 {
        return UInt64.random(in: minValue...maxValue)
    }
}
