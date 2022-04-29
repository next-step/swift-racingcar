//
//  RacingForwardRandomNumberMaker.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

struct RacingForwardRandomNumberMaker: RacingForwardNumberMakable {
    func forward() -> Int {
        let moveValue = Int.random(in: 0...9)
        return (moveValue >= 4) ? 1 : 0
    }
}
