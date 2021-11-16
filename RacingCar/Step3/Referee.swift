//
//  Referee.swift
//  RacingCar
//
//  Created by Ppop on 2021/11/15.
//

protocol RefereeProtocol {
    func judge(_ value: Int) -> Bool
}

struct Referee: RefereeProtocol {
    func judge(_ value: Int) -> Bool {
        return (0...4).contains(value)
    }
}
