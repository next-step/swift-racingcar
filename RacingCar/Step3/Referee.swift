//
//  Referee.swift
//  RacingCar
//
//  Created by Ppop on 2021/11/15.
//

protocol RefereeProtocol {
    func judge(_ value: Int, completionHandler: ((Bool) -> Void))
}

struct Referee: RefereeProtocol {
    func judge(_ value: Int, completionHandler: ((Bool) -> Void)) {
        completionHandler((0...4).contains(value))
    }
}
