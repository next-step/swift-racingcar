//
//  Racer.swift
//  RacingCar
//
//  Created by Ppop on 2021/11/15.
//

protocol RacerPtorocol {
    func throwDice(completionHandler: ((Int) -> Void))
}

struct Racer: RacerPtorocol {
    func throwDice(completionHandler: ((Int) -> Void)) {
        completionHandler(Int.random(in: 0...9))
    }
}
