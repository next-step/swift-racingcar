//
//  MoveChecker.swift
//  RacingCar
//
//  Created by itzel.du on 2021/11/10.
//

import Foundation

struct MoveChecker {
    let movableRange: ClosedRange<Int>
    
    func isMovable(_ number: Int) -> Bool {
        return movableRange.contains(number)
    }
}
