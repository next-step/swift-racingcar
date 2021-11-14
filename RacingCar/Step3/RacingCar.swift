//
//  RacingCar.swift
//  RacingCar
//
//  Created by 김효성 on 2021/11/14.
//

protocol RacingCarProtocol {
    var index: Int { get set }
    mutating func move()
}

struct RacingCar: RacingCarProtocol {
    var index: Int = 0
}

extension RacingCar {
    mutating func move() {
        index += 1
    }
}
