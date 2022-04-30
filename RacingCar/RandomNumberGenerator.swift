//
//  RandomNumberGenerator.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RandomNumberGenerator {
    let range: Range<Int>
    
    init(range: Range<Int>) {
        self.range = range
    }
    func generate() -> Int{
        return Int.random(in: range)
    }
}
