//
//  RandomNumber.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/12.
//

import Foundation

struct RandomNumber {
    private let range: ClosedRange<Int>
    
    var value: Int {
        Int.random(in: range)
    }
    
    init(range: ClosedRange<Int>) {
        self.range = range
    }
}
