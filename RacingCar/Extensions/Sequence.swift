//
//  Sequnce.swift
//  RacingCar
//
//  Created by nylah.j on 2022/05/03.
//

extension Sequence where Self.Iterator.Element == RacingCar {
    func copy() -> [RacingCar] {
        return self.map { racingCar in
            racingCar.copy() as! RacingCar
        }
    }
}
