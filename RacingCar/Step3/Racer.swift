//
//  Racer.swift
//  RacingCar
//
//  Created by Ppop on 2021/11/15.
//

protocol RacerPtorocol {
    func throwDice() -> Int
}

struct Racer: RacerPtorocol {
    func throwDice() -> Int {
        return Int.random(in: 0...9)
    }
}
